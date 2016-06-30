require 'curb'
require 'nokogiri'
require 'uri'


class CategoryParser

  def self.product_urls(category_url)
    host =  get_scheme_host(category_url)
    urls = []

    page = 1
    begin
      http = Curl.get(category_url, { page: page })
      page +=1      
      
      document = Nokogiri::HTML(http.body_str)      

      urls += document.xpath(link_pattern).map { |elem| host + elem.content }
    end while (http.response_code == 200)
   
    urls.uniq
  end

  def self.link_pattern
    "//a[@class='call_to_action _secondary _medium view_details']/@href"
  end

  def self.get_scheme_host(url)
    uri = URI(url)
    "#{uri.scheme}://#{uri.host}"
  end

end
