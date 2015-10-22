require 'oystercard'
describe Oystercard do

  let(:card) { described_class.new(described_class::DEFAULT_BALANCE, Journey)}
  let(:station) { double :station }
  let(:journey) { double(start_journey: :victoria) }

  it ' expects a new card to have no journey history' do
    expect(card.journey_history).to eq []
  end

  it ' expects atouch in and out to create one journey' do
    card.topup(50)
    card.touch_in(station)
    card.touch_out(station)
    expect(card.journey_history.length).to eq(1)
  end

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
          it "expect touch in to change active status to true" do
            expect(card.touch_in(station)).to eq station
          end

          xit "checks whether a card is in journey or not" do
            card.touch_in(station)
            expect(card.in_journey?).to eq true
          end
    end

    it "requires a minimum balances before touching in" do
      expect{card.touch_in(station)}.to raise_error "Please top up to £ #{Oystercard::MINIMUM_BALANCE} before touching in"
    end

    it "deducts travel fare from card balance when touching out" do
      card.topup(50)
      expect{card.touch_out(station)}.to change{card.balance}.by(-Oystercard::MINIMUM_BALANCE)
    end

  end
