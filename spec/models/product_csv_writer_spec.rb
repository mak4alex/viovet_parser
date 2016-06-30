require 'fileutils'
require_relative './../../models/product_csv_writer'
require_relative './../../models/product'


RSpec.describe ProductCSVWriter do
  let (:filepath) { File.expand_path('./spec/tmp/output.csv') }

  
  it 'writes product array to csv file' do     
    products = [
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


    ProductCSVWriter.write_products(filepath, products)

    actual_file = File.open(filepath)
    expected_file = File.open(File.expand_path('./spec/fixtures/products.csv'))

    expect(FileUtils.compare_file(actual_file, expected_file)).to be_truthy

  end

  after(:each) do
    File.delete(filepath) if File.exist?(filepath)
  end

end