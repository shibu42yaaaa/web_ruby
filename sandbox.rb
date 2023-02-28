class Product
    TAX_RATE = 1.1
    DISCOUNT_RATE = 0.8
  attr_reader :name, :title, :price

  def initialize(name, title, price)
    @name, @title, @price = name, title, price
  end

  # 消費税
  def tax_price(price)
    taxed_price = (price * TAX_RATE).round
    
    if taxed_price >= 1500
      dixcount_price = (taxed_price * DISCOUNT_RATE).round
      "#{dixcount_price}円"
    else
      "#{taxed_price}円"
    end
  end
  

  def to_s
    puts "歌手名:#{name}, タイトル:#{title}, 価格:#{tax_price(price)}"
  end


end

product_1 = Product.new('東京事変', '群青日和', 1000)
product_2 = Product.new('BiSH', 'オーケストラ', 1400)

product_1.to_s
product_2.to_s
