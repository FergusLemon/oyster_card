require 'oystercard'
describe Oystercard do

  let(:card) { Oystercard.new }

  context 'card balance' do
    it 'show the card balance' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end

    it 'topup card balance' do
      is_expected.to respond_to(:topup).with(1).argument
    end

    it 'You have tooped up too much' do
      card.topup(90)
      expect { card.topup(1) }.to raise_error "You have exceeded the balance limit of £#{Oystercard::LIMIT}"
    end

    it "Deducts the travel fare from the card" do
      card = Oystercard.new(50)
      card.deduct(10)
      expect(card.balance).to eq 40
    end

    # it "Raises an error if you cannot afford the fare" do
    #   card = Oystercard.new(50)
    #   card.deduct(60)
    #   expect {card.balance}.to raise_error "You cannot afford this ticket, you need to top up"
    # end
  end

end
