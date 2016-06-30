require 'curb'
require 'nokogiri'

class ProductParser

  def self.products_from_page(product_page_url)
    http = Curl.get(product_page_url)
    document = Nokogiri::HTML(http.body_str)      
    
    common_title  = self.common_title(document)    
    titles        = self.titles(document)
    prices        = self.prices(document)
    images        = self.images(document)
    deliveries_in = self.deliveries_in(document)
    codes         = self.codes(document)

    titles.map.with_index do |title, index|
      Product.new(
        title: "#{common_title} - #{title}",
        price: prices[index],
        image: "http:#{images[index]}",
        delivery_in: deliveries_in[index],
        code: codes[index]
      )
    end
  end

  def self.trim_content(values)
    values.map do |value|
      value.content.gsub(/\n\s+/, '')
    end
  end

  def self.common_title(document)
    document.xpath(common_title_pattern).children.text
  end

  def self.titles(document)
    nodes = document.xpath(titles_pattern) 
    trim_content(nodes)
  end

  def self.prices(document)
    nodes = document.xpath(prices_pattern) 
    trim_content(nodes)
  end

  def self.images(document)
    nodes = document.xpath(images_pattern) 
    trim_content(nodes)
  end

  def self.deliveries_in(document)
    nodes = document.xpath(deliveries_in_pattern) 
    trim_content(nodes)
  end

  def self.codes(document)
    nodes = document.xpath(codes_pattern) 
    trim_content(nodes)
  end

  def self.common_title_pattern
    "//*[@id = 'product_family_heading']"
  end

  def self.titles_pattern
    "//*[@class = 'title']"
  end 

  def self.prices_pattern
    "//*[@itemprop = 'price']"
  end

  def self.images_pattern
    "//a[@itemprop = 'image']/@href"
  end

  def self.deliveries_in_pattern
    "//*[@class = 'stock in-stock']"
  end

  def self.codes_pattern
    "//*[@itemprop = 'sku']"
  end

end
