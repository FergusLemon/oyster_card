require 'oystercard'
describe Oystercard do

  context 'card balance' do
    it 'show the card balance' do
      expect(subject.balance).to eq 0
    end

    it 'topup card balance' do
      is_expected.to respond_to(:topup).with(1).argument
    end

    it 'you\'re topping up too much on your new card' do
      card = subject
      card.topup 101
      expect(card.balance).not_to be > 100
    end

    it 'You have tooped up too much' do
      card = Oystercard.new
      card.topup(101)
      expect(card.balance).not_to be > 100
    end

  end

end
