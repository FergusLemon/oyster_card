# require 'barriers'
# #
# # describe Barriers do
# #   let(:card) {double :card}
# #   before(:each) do
# #     allow(card).to receive(:activate).and_return(true)
# #     allow(card).to receive(:deactivate).and_return(false)
# #     # allow(card).to receive(:deduct).and_return((Oystercard.new.balance - Oystercard::MINIMUM_BALANCE))
# #   end
# # 
# #     describe "#touch_in" do
# #       it "allows barrier to change in journey status to true" do
# #         expect(subject.touch_in(card)).to eq true
# #       end
# #     end
# #
# #     describe "#touch_out" do
# #       it "allows barrier to change in journey status to false" do
# #         expect(subject.touch_out(card)).to eq false
# #       end
# #     end
# #
# #     it 'expect touch out to reduce balance by minimum balance' do
# #       card = Oystercard.new
# #       card.topup(50)
# #       expect {subject.touch_out(card)}.to change{card.balance_reader}.by(-Oystercard::MINIMUM_BALANCE)
# #     end
# #
#
#
# end
