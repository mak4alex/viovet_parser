class Product
  attr_accessor :title, :price, :image, :delivery_in, :code

  def initialize(options = {})
    @title       = options[:title] || ''
    @price       = options[:price] || ''
    @image       = options[:image] || ''
    @delivery_in = options[:delivery_in] || ''
    @code        = options[:code] || ''
  end

  def ==(another)
    title == another.title &&
      price == another.price &&
      image == another.image &&
      delivery_in == another.delivery_in &&
      code == another.code
  end

  def to_a
    [title, price, image, delivery_in, code]
  end

end
