class Oystercard

LIMIT = 90
DEFAULT_BALANCE = 0
MINIMUM_BALANCE = 1
attr_reader :balance, :entry_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
  end

  def topup(value)
    fail "You have exceeded the balance limit of £#{LIMIT}" if card_full?(value)
    @balance += value
  end

  def touch_in(station)
    fail "Please top up to £ #{MINIMUM_BALANCE} before touching in" if empty?
    @entry_station = station
  end

  def touch_out(value = MINIMUM_BALANCE)
    deduct(value)
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

    def card_full?(value)
      @balance + value > LIMIT
    end

    def empty?
      @balance < MINIMUM_BALANCE
    end

    def deduct(value)
      @balance -= value
    end

end
