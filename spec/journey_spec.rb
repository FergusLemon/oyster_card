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
      expect(journey.end_journey(exit_station.name)).to eq :angel
    end
  end




end
