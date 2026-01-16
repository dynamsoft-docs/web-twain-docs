# _plugins/raw_content_for_collections.rb
module Jekyll
  class RawContentForCollections < Generator
    safe true
    priority :low

    def generate(site)
      # 遍历所有集合
      site.collections.each do |label, collection|
        next unless label == 'articles' # 只处理 articles 集合

        collection.docs.each do |doc|
          # 获取源文件的完整路径
          source_path = File.join(site.source, doc.relative_path)
          if File.exist?(source_path)
            # 读取原始内容（注意：包含 Front Matter）
            raw_file_content = File.read(source_path)

            # 可选：移除 Front Matter，只保留正文 Markdown
            # 如果你希望 raw_content 不包含 Front Matter，取消下面注释
            # raw_markdown = remove_front_matter(raw_file_content)

            # 这里我们保留整个文件内容（含 Front Matter）
            doc.data['raw_content'] = raw_file_content
          end
        end
      end
    end

    # 可选辅助方法：移除 Front Matter，仅保留 Markdown 正文
    private

    def remove_front_matter(content)
      if content =~ /\A(---\s*\n.*?\n---\s*\n)/m
        content.sub(/\A(---\s*\n.*?\n---\s*\n)/m, '')
      else
        content
      end
    end
  end
end