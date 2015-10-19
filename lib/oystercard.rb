class Oystercard

attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def topup(value)
    @balance += value
  end

end
