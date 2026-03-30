module GenerateTagPages
  class Generator < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      site.tags.each do |tag, posts|
        site.pages << TagPage.new(site, tag)
      end
    end
  end

  class TagPage < Jekyll::Page
    def initialize(site, tag)
      @site = site
      @base = site.source
      @dir = File.join('tags', tag)
      @name = 'index.html'

      process(@name)
      read_yaml(File.join(@base, '_layouts'), 'tag_index.html')
      data['tag'] = tag
      data['title'] = "Tag: #{tag}"
    end
  end
end