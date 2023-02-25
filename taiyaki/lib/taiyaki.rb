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
