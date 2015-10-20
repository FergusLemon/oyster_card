require_relative 'oystercard'

class Barriers

  def touch_in(card)
    card.activate
  end

  def touch_out(card)
    card.deactivate
  end


end
