require_relative 'station'

class Journey

MIN_FARE = 1
PENALTY_FARE = 6

attr_reader :trip

def initialize
   @trip = {}
   @journey_history = []
 end


 def start_journey(entry_station)
   @trip[:entry_station] = entry_station.name
   @trip[:exit_station] = nil
 end

 def end_journey(exit_station)
   @trip[:exit_station] = exit_station.name
   journey_complete?
   add_history
 end

 def journey_complete?
   !(@trip[:exit_station] == nil || @trip[:entry_station] == nil)
 end

 def fare
   fare_calculator
 end

 private

 def add_history
   @journey_history << {@trip[:entry_station] => @trip[:exit_station]}
 end

 def fare_calculator
   journey_complete? ? MIN_FARE : PENALTY_FARE
 end

end
