require_relative './../../models/category_parser'


RSpec.describe CategoryParser do
  
  it 'finds all product urls in category page' do
    category_url = 'https://www.viovet.co.uk/Pet_Foods_Diets-Dogs-Hills_Pet_Nutrition-Hills_Prescription_Diets/c233_234_2678_93/category.html'
    expected_urls = [
      'https://www.viovet.co.uk/Hills_Prescription_Diet_zd_Dog_Food/c107/',
      'https://www.viovet.co.uk/Hills_Prescription_Diet_jd_Dog_Food/c100/',
      'https://www.viovet.co.uk/Hills_Prescription_Diet_kd_Dog_Food/c101/',
      'https://www.viovet.co.uk/Hills_Prescription_Diet_bd_Dog_Food/c95/',
      'https://www.viovet.co.uk/Hills_Prescription_Diet_sd_Dog_Food/c103/',
      'https://www.viovet.co.uk/Hills_Prescription_Diet_hd_Dog_Food/c98/'
    ]

    actual_urls = CategoryParser.product_urls(category_url)

    expect(actual_urls).to include(*expected_urls)
  end

end
