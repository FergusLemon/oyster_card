class Oystercard

LIMIT = 90
DEFAULT_BALANCE = 0
MINIMUM_BALANCE = 1
attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE, journey_klass)
    @balance = balance
    @journey = journey_klass.new
  end

  def topup(value)
    fail "You have exceeded the balance limit of £#{LIMIT}" if card_full?(value)
    @balance += value
  end

  def touch_in(station)
    fail "Please top up to £ #{MINIMUM_BALANCE} before touching in" if empty?
    @journey.start_journey(station)
  end

  def touch_out(station)
    deduct
    @journey.end_journey(station)
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

    def deduct
      @balance -= MINIMUM_BALANCE
    end



end
