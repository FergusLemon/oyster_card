require 'station'
describe Station do

  let(:subject) { Station.new(name: station_1, zone: zone_0)}

  it 'has name and zone attributes' do
    expect(subject).to have_attributes(:name => "station_1", :zone => "zone_0")
  end

end
