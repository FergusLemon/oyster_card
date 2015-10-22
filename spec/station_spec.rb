require 'station'
describe Station do

  let(:station) { described_class.new("victoria",1) }

  describe '#initialize' do
    it 'has a name' do
      expect(station.name).to eq("victoria")
    end

    it 'has a zone' do
      expect(station.zone).to eq(1)
    end
  end

end
