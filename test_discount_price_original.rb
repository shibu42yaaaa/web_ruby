require 'minitest/autorun'
require './discount_price_original'

class TestDiscountPrice < Minitest::Test
  def test_product
    product_1 = Product.new('マリオ',3000,2020)
    
    assert_equal 'マリオ', product_1.title
    assert_equal 3000, product_1.price
    assert_equal 'マリオ', product_1.title

  end
end