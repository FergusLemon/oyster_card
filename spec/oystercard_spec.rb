require 'oystercard'
describe Oystercard do

  let(:card) { described_class.new(described_class::DEFAULT_BALANCE, Journey)}
  let(:station) { double(name: :euston, zone: 2) }
  let(:start_journey) { double(start_journey: :victoria) } #allows journey object to receive the start_journey message and return victoria
  let(:end_journey) { double(end_journey: :angel) }
  let(:journey) { double :journey }

  context 'card balance' do
    it 'show the card balance' do
      expect(card.balance).to eq Oystercard::DEFAULT_BALANCE
    end

    it 'You have tooped up too much' do
      card.topup(90)
      expect { card.topup(1) }.to raise_error "You have exceeded the balance limit of £#{Oystercard::LIMIT}"
    end
  end

    context 'checking touching in and out change value of journey status while ignoring min bal' do
      before do
        card.topup(Oystercard::MINIMUM_BALANCE)
      end

    end

    it "requires a minimum balances before touching in" do
      expect{card.touch_in(station)}.to raise_error "Please top up to £ #{Oystercard::MINIMUM_BALANCE} before touching in"
    end

    before do
      allow(journey).to receive(:fare).and_return(1)
    end

    it "deducts travel fare from card balance when touching out" do
      card.topup(50)
      expect { card.touch_out(station) }.to change { card.balance }.by(-6)
    end

  end
