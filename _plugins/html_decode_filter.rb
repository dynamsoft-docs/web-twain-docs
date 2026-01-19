module Jekyll
  module HtmlDecodeFilter
    require 'cgi'
    
    def html_decode(input)
      return '' if input.nil?
      CGI.unescapeHTML(input.to_s)
    end
  end
end

Liquid::Template.register_filter(Jekyll::HtmlDecodeFilter)