require_relative '../fluent_calculator'

describe FluentCalculator do
  describe 'initialization' do
    it 'has a default value of 0' do
      expect(FluentCalculator.new).to eq(0)
    end
  end

  describe 'arithmetic' do
    it 'adds two numbers' do
      expect(FluentCalculator.new.one.plus.four).to eq(5)
    end

    it 'subtracts the right operand from the left operand' do
      expect(FluentCalculator.new.nine.minus.three).to eq(6)
    end

    it 'multiplies two numbers' do
      expect(FluentCalculator.new.five.times.five).to eq(25)
    end 

    it 'divides the left operand by the right operand' do
      expect(FluentCalculator.new.nine.minus.three).to eq(6)
    end
  
    it 'raises ZeroDivisionError when dividing by zero' do
      expect { FluentCalculator.new.nine.divided_by.zero }.to raise_error(ZeroDivisionError)
    end

    xit 'returns the remainder of division of the left operand by the right operand' do
      expect(FluentCalculator.new.five.modulus.two).to eq(1)
    end

    xit 'raises ZeroDivisionError when using modulus and dividing by zero' do
      expect { FluentCalculator.new.nine.modulus.zero }.to raise_error(ZeroDivisionError)
    end

    xit 'returns the left operand to the power of the right operand' do
      expect(FluentCalculator.new.five.to_the_power_of.two).to eq(25)
    end
  end

  describe 'equality comparison' do
    let(:calc) { FluentCalculator.new.three.times.four }

    it 'can be compared to other calculators' do
      expect(calc == FluentCalculator.new.six.times.two).to be(true)
      expect(calc == FluentCalculator.new.six.times.six).to be(false)
    end

    it 'can be compared to numeric strings' do
      expect(calc == "12").to be(true)
      expect(calc == "twelve").to be(false)
    end

    it 'can be compared to numeric types' do
      expect(calc == 12).to be(true)
      expect(calc == 12.0).to be(true)
      expect(calc == 12.2).to be(false)
    end

    it 'returns false when compared to other types' do
      expect(calc == { 'value': '12' }).to be(false)
      expect(calc == ['12']).to be(false)
    end
  end
end
