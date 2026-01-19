module Jekyll
  module CustomFilters
    def render_article_links(content)
      content = content.gsub(%r{/_articles/(.*?)\.md}, 
                           'https://www.dynamsoft.com/web-twain/docs/\1.html')
      
      return content
    end
  end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)