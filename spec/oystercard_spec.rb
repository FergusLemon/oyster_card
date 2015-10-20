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
      card.topup(50)
      card.deduct(10)
      expect(card.balance).to eq 40
    end

    context 'checking activate changes value of journey status while ignoring min bal' do
      before do
        subject.topup(Oystercard::MINIMUM_BALANCE)
      end
          it "expect activate to change active status to true" do
            expect(subject.activate).to eq true
          end

          it "expect deactivate to change active status to false" do
            subject.activate
            expect(subject.deactivate).to eq false
          end

          it "checks whether a card is in journey or not" do
            subject.activate
            expect(subject.check_in_journey?).to eq true
          end
    end

    it "requires a minimum balances before touching in" do
      card.topup(Oystercard::MINIMUM_BALANCE)
      card.deduct(1)
      expect{subject.activate}.to raise_error "Please top up to £ #{Oystercard::MINIMUM_BALANCE} before touching in"
    end

  end

end
