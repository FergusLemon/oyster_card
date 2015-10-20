class Oystercard

LIMIT = 90
DEFAULT_BALANCE = 0
attr_accessor :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def topup(value)
    fail "You have exceeded the balance limit of £#{LIMIT}" if card_full?(value)
   @balance += value
  end

  def deduct(value)
   @balance -= value
  end

  private

  def card_full?(value)
    @balance + value > LIMIT
  end
end
