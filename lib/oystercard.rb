class Oystercard

LIMIT = 90
DEFAULT_BALANCE = 0
MINIMUM_BALANCE = 1
attr_reader :balance, :in_journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def topup(value)
    fail "You have exceeded the balance limit of £#{LIMIT}" if card_full?(value)
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def activate
    fail "Please top up to £ #{MINIMUM_BALANCE} before touching in" if empty?
    @in_journey = true
  end

  def deactivate
    @in_journey = false
  end

  def check_in_journey?
    @in_journey == true
  end

  private

    def card_full?(value)
      @balance + value > LIMIT
    end

    def empty?
      @balance < MINIMUM_BALANCE
    end

end
