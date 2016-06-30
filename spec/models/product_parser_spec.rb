require_relative './../../models/product'
require_relative './../../models/product_parser'


RSpec.describe ProductParser do
    
  it 'creates products from product page' do
    product_page_url = 'https://www.viovet.co.uk/Hills_Prescription_Diet_zd_Dog_Food/c107/'
    expected_products = [
      Product.new(
        title: 'Hills Prescription Diet z/d Dog Food - Dry » 3kg Bag',
        price: '24.04',
        image: 'http://static2.viovet.co.uk/pi/image_import_1436870926.jpg',
        delivery_in: 'Estimated dispatch within 24 working hours.',
        code: '110364'),
      Product.new(
        title: 'Hills Prescription Diet z/d Dog Food - Mini Dry » 6kg Bag',
        price: '41.75',
        image: 'http://static1.viovet.co.uk/pi/image_import_1436871351.jpg',
        delivery_in: 'Estimated dispatch within 24 working hours.',
        code: '180054'),
      Product.new(
        title: 'Hills Prescription Diet z/d Dog Food - Ultra Allergen Free Wet » 12 x 370g Cans',
        price: '27.20',
        image: 'http://static2.viovet.co.uk/pi/image_import_1425053060.jpg',
        delivery_in: 'Estimated dispatch within 24 working hours.',
        code: '110367')
    ]

    actual_products = ProductParser.products_from_page(product_page_url)

    expect(actual_products).to include(*expected_products)
  end


end
