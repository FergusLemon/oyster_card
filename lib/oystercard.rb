class Oystercard

LIMIT = 90
DEFAULT_BALANCE = 0
attr_accessor :balance

  def initialize(balance = DEFAULT_BALANCE)
    # fail_topping
    if balance >= LIMIT
      balance = LIMIT
      @balance = balance
      "You have only topped up £90 because the limit is £#{LIMIT}."
    else
      @balance = balance
    end
  end

  def topup(value)
    if value + @balance > LIMIT
      topping_up = LIMIT - @balance
      @balance += topping_up
      puts "You have only topped up #{topping_up} because the limit is £#{LIMIT}."
      @balance
    else
      @balance += value
    end

  end

  def deduct(value)
    if value > @balance
      fail "You cannot afford this ticket, you need to top up"
    else
      @balance -= value
    end
  end
#
# private
#
#   def fail_topping
#     fail 'exeeded the limit of 100 £' if balance >= 100
#   end

end
