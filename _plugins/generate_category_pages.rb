require 'jekyll/utils'

module GenerateCategoryPages
  class Generator < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      site.categories.each do |category, posts|
        site.pages << CategoryPage.new(site, category)
      end
    end
  end

  class CategoryPage < Jekyll::Page
    def initialize(site, category)
      @site = site
      @base = site.source
      @dir = File.join('categorias', Jekyll::Utils.slugify(category))
      @name = 'index.html'

      process(@name)
      read_yaml(File.join(@base, '_layouts'), 'category_index.html')
      data['category'] = category
      data['title'] = "Categoria: #{category}"
    end
  end
end