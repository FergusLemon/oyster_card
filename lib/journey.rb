class Journey

attr_reader :entry_station, :exit_station

  def initialize
    @journey_history = []
    @entry_station = nil
    @exit_station = nil
  end


  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
    add_history
  end

  def journey_complete?
    entry_station == nil && exit_station == nil ? true : false
  end

  private

  def add_history
    @journey_history << {@entry_station => @exit_station}
    @entry_station = nil
    @exit_station = nil
  end

end
