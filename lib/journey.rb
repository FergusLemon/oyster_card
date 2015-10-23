require_relative 'station'

class Journey

MIN_FARE = 1
PENALTY_FARE = 6

attr_reader :entry_station

def initialize
   @journey_history = []
 end


 def start_journey(entry_station)

   @entry_station = entry_station.name
 end

 def end_journey(exit_station)
   @exit_station = exit_station.name
   add_history
 end

 def journey_complete?
   @entry_station == nil && @exit_station == nil
 end

 def journey_in_progress?
   @entry_station != nil
 end

 def fare
   fare_calculator
 end

 def add_history
   @journey_history << {@entry_station => @exit_station}
   @entry_station = nil
   @exit_station = nil
 end

 private

 def fare_calculator
   if @journey_history.last.include? (nil)
     PENALTY_FARE
   else
     MIN_FARE
   end
 end

end
