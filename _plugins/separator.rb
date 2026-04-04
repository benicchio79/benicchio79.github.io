module Separator
  class Generator < Jekyll::Generator
    def generate(site)
      # Converter nos posts
      site.posts.docs.each do |post|
        post.content = post.content.gsub(/^\*\*\*$/, '<div style="text-align: center; color: #666; letter-spacing: 0.5rem;">• • •</div>')
      end

      # Converter nas páginas (sobre, outros-lugares, etc.)
      site.pages.each do |page|
        if page.content
          page.content = page.content.gsub(/^\*\*\*$/, '<div style="text-align: center; color: #666; letter-spacing: 0.5rem;">• • •</div>')
        end
      end
    end
  end
end