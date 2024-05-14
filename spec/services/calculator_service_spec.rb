require 'rails_helper'

RSpec.describe CalculatorService do
  describe '.add' do
    context 'when string is empty' do
      it 'returns 0' do
        expect(CalculatorService.add("")).to eq(0)
      end
    end

    context 'when string contains a single number' do
      it 'returns the number' do
        expect(CalculatorService.add("1")).to eq(1)
      end
    end

    context 'when string contains multiple numbers' do
      it 'returns the sum of the numbers' do
        expect(CalculatorService.add("1,4")).to eq(5)
      end
    end
  end
end
