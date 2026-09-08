# _plugins/copy_markdown.rb
#
# Publishes a plain-Markdown copy of each content page so llms.txt (and similar
# llms*.txt files) can link to Markdown versions of every page, e.g.
# https://www.dynamsoft.com/web-twain/docs/general-usage/index.md
#
# A verbatim copy of the source file is not enough: its links are either
# repo-relative (/_articles/foo.md), relative (./foo.md), or unrendered Liquid
# ({{site.general-usage}}...). None of those resolve on the published site.
# This plugin snapshots each page's Markdown AFTER Jekyll has resolved links:
#   - jekyll-relative-links (a :lowest generator) already rewrote
#     /_articles/foo.md and ./foo.md into the canonical site URL
#     (/web-twain/docs/foo.html) inside doc.content;
#   - in :pre_render we run the content through Liquid once more, so {{site.*}}
#     links are expanded too;
#   - we then rewrite canonical .../foo.html links into their full .md URLs so
#     the published Markdown stays self-contained.
# The original YAML front matter is preserved as-is. Links inside inline HTML
# (<a href="...">) and image/asset links are intentionally left untouched.
#
# The snapshot is taken in :pre_render (where the resolved Markdown still
# exists) and written to disk only in :site :post_write, after Jekyll has
# cleaned the destination folder; extra files written earlier would be pruned
# as orphans.
#
# Which pages/collections are published, and the URL base, come from
# _config.yml:
#
#   copy_markdown_advanced:
#     enabled: true
#     collections: ["articles"]   # array of collection labels, or true = all
#     pages: false                # also publish top-level Markdown pages
#     exclude: ["README.md"]      # optional: path names or directory prefixes to skip
#     full_url: ""                # optional; defaults to site.docFullPath, then url + baseurl
#
# The plugin is inert unless the copy_markdown_advanced block is present and enabled.
require 'fileutils'

module CopyMarkdownForLlm
  KEY = 'copy_markdown_advanced'
  MD_EXTENSIONS = %w[.md .markdown].freeze

  # "collection-doc:path" or "page:path" => rendered Markdown (front matter + body)
  BUFFER = {}

  module_function

  def plugin_config(site)
    cfg = site.config[KEY]
    cfg.is_a?(Hash) ? cfg : {}
  end

  def enabled?(site)
    cfg = plugin_config(site)
    return false if cfg.empty?

    cfg.fetch('enabled', true)
  end

  def markdown?(item)
    MD_EXTENSIONS.include?(File.extname(item.relative_path).downcase)
  end

  def excluded?(site, relative_path)
    patterns = plugin_config(site)['exclude']
    return false unless patterns

    Array(patterns).any? do |pat|
      pat = pat.to_s.sub(%r{/+\z}, '')
      relative_path == pat || relative_path.start_with?("#{pat}/") || File.basename(relative_path) == pat
    end
  end

  def collection_enabled?(site, label)
    value = plugin_config(site)['collections']
    return false if value.nil? || value == false

    value == true || Array(value).map(&:to_s).include?(label.to_s)
  end

  # Is this document/page a Markdown page we should publish a .md copy of?
  def process?(site, item)
    relative_path = item.relative_path.tr('\\', '/')
    return false unless markdown?(item)
    return false if excluded?(site, relative_path)

    if item.respond_to?(:collection) && item.collection
      collection_enabled?(site, item.collection.label)
    else
      !!plugin_config(site)['pages']
    end
  end

  # Absolute base used for the rewritten links (read from config, nothing
  # hard-coded): copy_markdown.full_url > docFullPath > url + baseurl.
  def link_bases(site)
    full = plugin_config(site)['full_url'].to_s
    full = site.config['docFullPath'].to_s if full.empty?
    full = "#{site.config['url']}#{site.config['baseurl']}" if full.empty?
    full = full.sub(%r{/+\z}, '')
    root = site.config['baseurl'].to_s.sub(%r{/+\z}, '')
    [full, root]
  end

  # Rewrite an internal docs URL (…/foo.html in either its root-absolute or
  # full-URL form) to the .md form. Anything else is returned unchanged; a
  # "#fragment" is preserved.
  def to_full_md(dest, full_base, root_base)
    rel =
      if !root_base.empty? && dest.start_with?("#{root_base}/")
        dest.sub(%r{\A#{Regexp.escape(root_base)}}, '')
      elsif !full_base.empty? && dest.start_with?("#{full_base}/")
        dest.sub(%r{\A#{Regexp.escape(full_base)}}, '')
      end
    return dest unless rel

    path, fragment = rel.split('#', 2)
    return dest unless path =~ /\.html\z/i

    output = if full_base.empty?
               "#{root_base}#{path.sub(/\.html\z/i, '')}.md"
             else
               "#{full_base}#{path.sub(/\.html\z/i, '')}.md"
             end
    fragment ? "#{output}##{fragment}" : output
  end

  # @return [String, nil] final Markdown (original front matter + body), or nil.
  def snapshot(site, item, payload)
    source_path = File.join(site.source, item.relative_path)
    return nil unless File.exist?(source_path)

    full_base, root_base = link_bases(site)

    # Keep the original YAML front matter byte-for-byte.
    raw = File.binread(source_path).force_encoding('UTF-8')
    front_matter = raw[/\A---\s*\n.*?\n---\s*\n+/m] || ''

    # doc.content already has its .md/relative links resolved by
    # jekyll-relative-links; expand the remaining {{ }} / {% %} via Liquid.
    content = item.content.to_s
    if item.respond_to?(:render_with_liquid?) && item.render_with_liquid?
      registers = { :site => site, :page => payload.is_a?(Hash) ? payload['page'] : nil }
      content = site.liquid_renderer.file(item.path).parse(content).render!(payload, :registers => registers)
    end

    # Canonical site links -> full .md links, for Markdown links only. Links in
    # inline HTML (<a href="...">) are intentionally left untouched.
    content = content.gsub(%r{(\]\()([^)\s]+)}) do
      head = Regexp.last_match(1)
      dest = Regexp.last_match(2)
      "#{head}#{to_full_md(dest, full_base, root_base)}"
    end

    front_matter + content
  end

  # Filesystem path of the .md copy inside site.dest (mirrors the .html page URL).
  def dest_path(site, item)
    return nil unless item.url.to_s =~ /\.html\z/i

    File.join(site.dest, item.url.sub(/\.html\z/i, '').sub(%r{\A/+}, '') + '.md')
  end

  def buffer_key(item)
    kind = item.respond_to?(:collection) && item.collection ? 'collection' : 'page'
    "#{kind}:#{item.relative_path.tr('\\', '/')}"
  end
end

# Take the snapshot while the fully-resolved Markdown still exists (before the
# document/page is converted to HTML).
def copy_markdown_pre_render(item, payload)
  return unless item.respond_to?(:site) && CopyMarkdownForLlm.enabled?(item.site)
  return unless CopyMarkdownForLlm.process?(item.site, item)

  content = CopyMarkdownForLlm.snapshot(item.site, item, payload)
  CopyMarkdownForLlm::BUFFER[CopyMarkdownForLlm.buffer_key(item)] = content if content
end

Jekyll::Hooks.register :documents, :pre_render do |doc, payload|
  copy_markdown_pre_render(doc, payload)
end

Jekyll::Hooks.register :pages, :pre_render do |page, payload|
  copy_markdown_pre_render(page, payload)
end

# Write the .md copies after Jekyll has cleaned the destination folder.
Jekyll::Hooks.register :site, :post_write do |site|
  next unless CopyMarkdownForLlm.enabled?(site)

  items = site.pages.dup
  site.collections.each_value { |collection| items.concat(collection.docs) }

  items.each do |item|
    next unless CopyMarkdownForLlm.process?(site, item)

    content = CopyMarkdownForLlm::BUFFER.delete(CopyMarkdownForLlm.buffer_key(item))
    next unless content

    path = CopyMarkdownForLlm.dest_path(site, item)
    next unless path

    FileUtils.mkdir_p(File.dirname(path))
    File.binwrite(path, content)
  end
end
