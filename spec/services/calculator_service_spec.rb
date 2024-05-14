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

    context 'when string contains multiple numbers separated by commas and new lines' do
      it 'returns the sum of the numbers' do
        expect(CalculatorService.add("1\n2,3")).to eq(6)
      end
    end

    context 'when string contains a comma followed by a new line' do
      it 'raises an ArgumentError' do
        expect { CalculatorService.add("1,\n") }.to raise_error(ArgumentError)
      end
    end

    context 'when changing delimiter using //[delimiter]' do
      it 'returns the sum of numbers separated by the specified delimiter' do
        expect(CalculatorService.add("//;\n1;2")).to eq(3)
      end
    end
  end
end
