module Separator
  class Generator < Jekyll::Generator
    def generate(site)
      site.posts.docs.each do |post|
        post.content = post.content.gsub(/^\*\*\*$/, '<div style="text-align: center; color: #666; letter-spacing: 0.5rem;">• • •</div>')
      end
    end
  end
end