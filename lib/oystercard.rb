class Oystercard

attr_accessor :balance

  def initialize(balance = 0)
    # fail_topping
    if balance >= 100
      balance = 100
      @balance = balance
      'you have only topped up 100£ because exeeded the limit of 100'
    else
      @balance = balance
    end
  end

  def topup(value)
    if value + @balance > 100
      topping_up = 100 - @balance
      @balance += topping_up
      puts "You have only topped up #{topping_up} because the limit is 100£"
      @balance
    else
      @balance += value
    end
  end
#
# private
#
#   def fail_topping
#     fail 'exeeded the limit of 100 £' if balance >= 100
#   end

end
