require 'oystercard'
describe Oystercard do

  context 'card balance' do
    it 'show the card balance' do
      expect(subject.balance).to eq 0
    end

    it 'topup card balance' do
      is_expected.to respond_to(:topup).with(1).argument
    end

  end

end
