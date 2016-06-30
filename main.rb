require 'rubygems'
require 'bundler/setup'
require './models/viovet_parser'

category_url = 'https://www.viovet.co.uk/Pet_Foods_Diets-Dogs-Hills_Pet_Nutrition-Hills_Prescription_Diets/c233_234_2678_93/category.html'
filepath = 'animal_goods.csv' 

ViovetParser.from_web_category_to_file(category_url, filepath)
