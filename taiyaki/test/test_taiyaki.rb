require 'minitest/autorun'
require './lib/taiyaki'

class TaiyakiTest < Minitest::Test
  def test_taiyaki
    taiyaki_1 = Taiyaki.new('あずき', 'ふつう')
    assert_equal 'あずき', taiyaki_1.anko
    assert_equal 'ふつう', taiyaki_1.size
    assert_equal 100, taiyaki_1.price

    taiyaki_2 = Taiyaki.new('白あん', '大きめ')
    assert_equal '白あん', taiyaki_2.anko
    assert_equal '大きめ', taiyaki_2.size
    assert_equal 180, taiyaki_2.price
    
  end

  #賞味期限テスト
  def test_expired
    taiyaki = Taiyaki.new('あんこ','ふつう')

    #当日
    assert_equal Date.today, taiyaki.produced_on

    #賞味期限=製造日＋３日
    assert_equal (Date.today + 3), taiyaki.expire_on

    # いける
    exoired?
    # まだいける（１〜３日）
    # もう無理（４日以降）
    expired?
  end

end
