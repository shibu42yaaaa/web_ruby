require 'minitest/autorun'
require 'date'

class Taiyaki
  attr_reader :anko, :size, :produced_on
  
  def initialize(anko, size)
    @anko = anko
    @size = size
    @produced_on = Date.today
  end

  def price
    amount = 100
    if anko == '白あん'
      amount += 30
    end
    if size == '大きめ'
      amount += 50
    end
    amount
  end

  def expire_on
    produced_on + 3
  end

  def expired?(today = Date.today)
    expire_on < today
  end
end

class TaiyakiPlusTest < Minitest::Test
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

  #賞味期限のテスト
  def test_expired
    taiyaki = Taiyaki.new('あずき', 'ふつう')
    
    #当日
    assert_equal Date.today, taiyaki.produced_on

    #賞味期限 = 製造日+三日後
    assert_equal (Date.today + 3), taiyaki.expire_on

    #当日いける
    refute taiyaki.expired?
    
    #三日までいける
    refute taiyaki.expired?(Date.today + 3)
    
    #四日は無理
    assert taiyaki.expired?(Date.today + 4)
  end
end
