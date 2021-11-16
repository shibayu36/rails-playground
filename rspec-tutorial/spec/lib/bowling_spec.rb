require 'bowling'

RSpec.describe Bowling do
  describe '#score' do
    context 'with no strikes or spares' do
      it 'sums the pin count for each roll' do
        bowling = Bowling.new
        20.times { bowling.hit(4) }
        expect(bowling.score).to eq 80
      end
    end

    context 'mock sample' do
      it 'calls once' do
        bowling = Bowling.new
        expect(bowling).not_to receive(:hit)
        bowling.hit(4)
        bowling.hit(4)
      end
    end
  end
end
