class Product
  attr_reader :title, :price, :produced_at

  def initialize(title, price, produced_at)
    @title, @price, @produced_at = title, price, produced_at
  end
  
  # 消費税価格
  def tax_price(price)
    tax_rate = 1.1
    taxed_price = (price * tax_rate).round
    if produced_at < 2015
      discount_price = (taxed_price * 0.8).round
      "#{discount_price}円"
    else
      "#{taxed_price}円"
    end
  end

  

  def to_s
    puts "タイトル:#{title}/値段:#{tax_price(price)}/発売:#{produced_at}年"
  end
end

product_1 = Product.new('メタルギアソリッド',5400, 1998)
product_2 = Product.new('マリオカート',6000, 2020)
product_1.to_s
product_2.to_s
