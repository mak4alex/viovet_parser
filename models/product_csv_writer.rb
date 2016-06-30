require 'csv'

class ProductCSVWriter

  def self.write_products(path, products)
    CSV.open(path, 'w', write_headers: true, headers: headers) do |csv|
      products.each do |product|
        csv << product.to_a
      end 
    end
  end

  def self.headers
    [ 'Title', 'Price', 'Image', 'Delivery In', 'Code']
  end

end
