require 'journey'

describe Journey do

  let(:journey) { described_class.new }
  let(:entry_station) { double(name: :euston, zone: 2) }
  let(:exit_station) { double(name: :angel, zone: 3) }

  context 'going on a journey' do

    it 'starts a journey' do
      expect(journey.start_journey(entry_station.name)).to eq :euston
    end

    it 'ends a journey' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.end_journey(exit_station)).to eq :angel
    end

    it 'returns when the journey is complete' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.journey_complete?).to eq(true)
    end

    it 'returns when the journey is not complete' do
      journey.start_journey(entry_station)
      expect(journey.journey_complete?).to eq(false)
    end

    it 'returns an empty value for entry station' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      journey.end_journey(exit_station)
      expect(journey.trip[:entry_station]).to be_nil
  end

end

  context 'fare' do

    it 'has a minimum fare' do
      expect(Journey::MIN_FARE).to eq 1
    end

    it 'has a penalty fare' do
      expect(Journey::PENALTY_FARE).to eq 6
    end

    it 'calculates a penalty fare when you touch out without touching in' do
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end


end
