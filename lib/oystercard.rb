class Oystercard

LIMIT = 90
DEFAULT_BALANCE = 0
attr_accessor :balance

  def initialize(balance = DEFAULT_BALANCE)
    balance <= LIMIT ? @balance = balance : "You cannot top up more than £#{LIMIT}"
  end

  def topup(value)
   value + @balance > LIMIT ? 'You are trying to top up too much' : @balance += value
  end

  def deduct(value)
    value > @balance ? 'You cannot afford this ticket' : @balance -= value
  end


end
