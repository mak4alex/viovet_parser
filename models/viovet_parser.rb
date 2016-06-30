require './models/category_parser'
require './models/product_parser'
require './models/product'
require './models/product_csv_writer'

class ViovetParser

  def self.from_web_category_to_file(category_url, filepath = 'products.csv')
    product_urls = CategoryParser.product_urls(category_url)
    
    products = product_urls.inject([]) do |prods, product_url|
      prods += ProductParser.products_from_page(product_url)
    end

    ProductCSVWriter.write_products(filepath, products)
  end

end