class Oystercard

LIMIT = 90
DEFAULT_BALANCE = 0
MINIMUM_BALANCE = 1
attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE, journey_klass = Journey)
    @balance = balance
    @journey_klass = journey_klass.new
  end

  def topup(value)
    fail "You have exceeded the balance limit of £#{LIMIT}" if card_full?(value)
    @balance += value
  end

  def touch_in(station)
    fail "Please top up to £ #{MINIMUM_BALANCE} before touching in" if empty?
    @journey_klass.start_journey(station)
  end

  def touch_out(station)
    @journey_klass.end_journey(station)
    deduct
  end

  def in_journey?
    @journey_klass.journey_complete? == false
  end

  private

    def card_full?(value)
      @balance + value > LIMIT
    end

    def empty?
      @balance < MINIMUM_BALANCE
    end

    def deduct
      @balance -= @journey_klass.fare
    end

end
