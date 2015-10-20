require 'oystercard'
describe Oystercard do

  let(:card) { Oystercard.new }
  let(:station) { double :station }


    it 'records the station where you #touch_in' do
      subject.topup(Oystercard::MINIMUM_BALANCE)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

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
      card.touch_out(10)
      expect(card.balance).to eq 40
    end

    context 'checking touching in and out change value of journey status while ignoring min bal' do
      before do
        subject.topup(Oystercard::MINIMUM_BALANCE)
      end
          it "expect touch in to change active status to true" do
            expect(subject.touch_in(station)).to eq station
          end

          it "expect touch out to change active status to false" do
            subject.touch_in(station)
            expect(subject.touch_out).to be(nil)
          end

          it "checks whether a card is in journey or not" do
            subject.touch_in(station)
            expect(subject.in_journey?).to eq true
          end
    end

    it "requires a minimum balances before touching in" do
      card.topup(Oystercard::MINIMUM_BALANCE)
      card.touch_out(1)
      expect{subject.touch_in(station)}.to raise_error "Please top up to £ #{Oystercard::MINIMUM_BALANCE} before touching in"
    end

    it "deducts travel fare from card balance when touching out" do
      subject.topup(50)
      expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_BALANCE)
    end

    it "deducts travel fare from card balance when touching out" do
      subject.topup(50)
      expect{subject.touch_out(30)}.to change{subject.balance}.by(-30)
    end

  end


end
