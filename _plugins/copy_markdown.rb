# _plugins/copy_markdown.rb
#
# Produces the plain-Markdown copy of each article that llms.txt links to, e.g.
# https://www.dynamsoft.com/web-twain/docs/general-usage/index.md
#
# A verbatim copy of the source file is not enough: its links are either
# repo-relative (/ _articles/foo.md), relative (./foo.md) or unrendered Liquid
# ({{site.general-usage}}...), none of which resolve on the published site.
# Instead we snapshot each article's Markdown *after Jekyll has resolved links*:
#   - jekyll-relative-links (a :lowest generator, runs before rendering) already
#     rewrote /_articles/foo.md and ./foo.md into the canonical site URL
#     (/web-twain/docs/foo.html) inside doc.content;
#   - in the :pre_render hook (still Markdown, before HTML conversion) we run the
#     content through Liquid once more so {{site.*}} links are expanded too;
#   - then we rewrite canonical /web-twain/docs/...html links into their full
#     .md URLs, so the published Markdown stays self-contained.
# The original YAML front matter is preserved as-is.
#
# The snapshot is taken in :pre_render (where the resolved Markdown exists) but
# only written to disk in :post_write, after Jekyll has cleaned the destination
# folder; extra files written earlier would otherwise be pruned as orphans.
require 'fileutils'

module CopyMarkdownForLlm
  # relative_path => rendered Markdown (original front matter + body)
  BUFFER = {}

  module_function

  # Rewrite an internal docs URL (/web-twain/docs/foo.html or its absolute
  # https://www.dynamsoft.com/web-twain/docs/foo.html form) to the full .md
  # form. Anything else is returned unchanged. "#fragment" is preserved.
  def to_full_md(dest, full_base, root_base)
    rel = if !root_base.empty? && dest.start_with?("#{root_base}/")
            dest.sub(%r{\A#{Regexp.escape(root_base)}}, '')
          elsif dest.start_with?("#{full_base}/")
            dest.sub(%r{\A#{Regexp.escape(full_base)}}, '')
          end
    return dest unless rel

    path, fragment = rel.split('#', 2)
    return dest unless path =~ /\.html\z/i

    path = path.sub(/\.html\z/i, '')
    "#{full_base}#{path}.md#{fragment ? "##{fragment}" : ''}"
  end

  # @return [String, nil] the final Markdown for the article, front matter included.
  def snapshot(doc, payload)
    source_path = File.join(doc.site.source, doc.relative_path)
    return nil unless File.exist?(source_path)

    full_base = doc.site.config['docFullPath'].to_s.sub(%r{/+\z}, '')
    full_base = 'https://www.dynamsoft.com/web-twain/docs' if full_base.empty?
    root_base = doc.site.config['baseurl'].to_s.sub(%r{/+\z}, '') # e.g. "/web-twain/docs"

    # Keep the original YAML front matter byte-for-byte.
    raw = File.binread(source_path).force_encoding('UTF-8')
    front_matter = raw[/\A---\s*\n.*?\n---\s*\n+/m] || ''

    # doc.content already has its .md/relative links resolved by
    # jekyll-relative-links; expand the remaining {{ }} / {% %} via Liquid.
    content = doc.content.to_s
    if doc.render_with_liquid?
      registers = { :site => doc.site, :page => payload.is_a?(Hash) ? payload['page'] : nil }
      content = doc.site.liquid_renderer.file(doc.path).parse(content).render!(payload, :registers => registers)
    end

    # Canonical site links -> full .md links, for Markdown links only
    # ([text](/web-twain/docs/foo.html)). Both the root-absolute form produced
    # by jekyll-relative-links and the absolute form left by Liquid are handled.
    # Links inside inline HTML (<a href="...">) are intentionally left untouched.
    content = content.gsub(%r{(\]\()([^)\s]+)}) do
      head = Regexp.last_match(1)
      dest = Regexp.last_match(2)
      "#{head}#{to_full_md(dest, full_base, root_base)}"
    end

    front_matter + content
  end
end

# Take the snapshot while the fully-resolved Markdown still exists (before the
# document is converted to HTML).
Jekyll::Hooks.register :documents, :pre_render do |doc, payload|
  next unless doc.respond_to?(:collection) && doc.collection&.label == 'articles'

  snapshot = CopyMarkdownForLlm.snapshot(doc, payload)
  CopyMarkdownForLlm::BUFFER[doc.relative_path] = snapshot if snapshot
end

# Write the .md copies after Jekyll has cleaned the destination folder.
Jekyll::Hooks.register :site, :post_write do |site|
  site.collections.each do |label, collection|
    next unless label == 'articles'

    collection.docs.each do |doc|
      content = CopyMarkdownForLlm::BUFFER.delete(doc.relative_path)
      next unless content

      dest_path = doc.destination(site.dest).sub(/\.html$/, '.md')
      FileUtils.mkdir_p(File.dirname(dest_path))
      File.binwrite(dest_path, content)
    end
  end
end
