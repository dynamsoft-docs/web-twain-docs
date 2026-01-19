# _plugins/raw_content_for_collections.rb
module Jekyll
  class RawContentForCollections < Generator
    safe true
    priority :low

    def generate(site)
      site.collections.each do |label, collection|
        next unless label == 'articles'
        collection.docs.each do |doc|
          source_path = File.join(site.source, doc.relative_path)
          
          if File.exist?(source_path)
            raw_file_content = File.read(source_path, encoding: 'UTF-8')
            content_without_front_matter = remove_front_matter(raw_file_content)
            doc.data['raw_content'] = content_without_front_matter
          end
        end
      end
      
    end

    private

    def remove_front_matter(content)
      if content =~ /\A---\s*\n.*?\n---\s*\n+/m
        result = content.sub(/\A---\s*\n.*?\n---\s*\n+/m, '')
        return result
      else
        return content
      end
    end
  end
end