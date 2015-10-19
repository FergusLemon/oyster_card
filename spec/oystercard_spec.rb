require 'oystercard'
describe Oystercard do

  context 'card balance' do
    it 'show the card balance' do
      expect(subject.balance).to eq 0
    end
  end

end
