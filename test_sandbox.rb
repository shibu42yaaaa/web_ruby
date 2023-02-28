require 'minitest/autorun'
require './sandbox'

class ProductTest < Minitest::Test
  def test_product
    product_1 = Product.new('東京事変', '能動的3分間', 1000)
    assert_equal '東京事変', product_1.name
    assert_equal '能動的3分間', product_1.title
    assert_equal 1000, product_1.price
    assert_equal '1100円', product_1.tax_price(1000)

    product_2 = Product.new('BiSH', 'プロミスザスター', 1500)
    assert_equal '1320円', product_2.tax_price(1500)

  end

  #
#   def test_expired
#     taiyaki = Taiyaki.new('あんこ','ふつう')

#     #当日
#     assert_equal Date.today, taiyaki.produced_on

#     #賞味期限=製造日＋３日
#     assert_equal (Date.today + 3), taiyaki.expire_on

#     # いける
#     exoired?
#     # まだいける（１〜３日）
#     # もう無理（４日以降）
#     expired?
#   end

end
