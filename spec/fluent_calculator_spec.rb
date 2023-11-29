require_relative '../fluent_calculator'

describe FluentCalculator do
  describe 'initialization' do
    # This test is disabled untill the class allows multiple calculations
    # AND the class overrides the equality operator.
    xit 'has a default value of 0' do
      expect(FluentCalculator.new).to eq(0)
    end

    (0..9).each do |number|
      it "includes an operand method for the number #{number}" do
        operand, _  = FluentCalculator::OPERANDS.to_a.find { |_,value| value == number }
        expect(FluentCalculator.new.respond_to?(operand)).to be(true)
      end
    end

    [:+, :-, :*, :/].each do |operator|
      it "includes an operation method for the operator #{operator}" do
        operation, _ = FluentCalculator::OPERATIONS.to_a.find { |_, op| op == operator }
        expect(FluentCalculator.new.respond_to?(operation)).to be(true)
      end
    end

    [:**, :%].each do |operator|
      # This test is disabled until exponentiation and modulus are implemented in the class
      xit "includes an operation method for the operator #{operator}" do
        operation, _ = FluentCalculator::OPERATIONS.to_a.find { |_, op| op == operator }
        expect(FluentCalculator.new.respond_to?(operation)).to be(true)
      end
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

    # This test is disabled until modulus is implemented in the class
    xit 'returns the remainder of division of the left operand by the right operand' do
      expect(FluentCalculator.new.five.modulus.two).to eq(1)
    end

    # This test is disabled until modulus is implemented in the class
    xit 'raises ZeroDivisionError when using modulus and dividing by zero' do
      expect { FluentCalculator.new.nine.modulus.zero }.to raise_error(ZeroDivisionError)
    end

    # This test is disabled until exponentiation is implemented in the class
    xit 'returns the left operand to the power of the right operand' do
      expect(FluentCalculator.new.five.to_the_power_of.two).to eq(25)
    end
  end

  describe 'arithmetic using random samples' do
    def random_operand(exlude_zero = false)
      operands = FluentCalculator::OPERANDS.to_a
      random_op = (exlude_zero ? operands.filter { |_, v| v != 0 } : operands).sample
      return random_op
    end

    def operation(op)
      return FluentCalculator::OPERATIONS.to_a.find { |_, operator| operator == op }
    end

    [
      { 'name': 'adds the right operand to the left operand', 'operator': :+, },
      { 'name': 'subtracts the right operand from the left operand', 'operator': :-, },
      { 'name': 'multiplies the left operand by the right operand', 'operator': :*, },
      # This test is disabled until exponentiation is implemented in the class
      # { 'name': 'raises the left operand to the power of the right operand', 'operator': :**, },
    ].each do |test_case|
      it "#{test_case[:name]}" do
        left_op, left_value = random_operand
        right_op, right_value = random_operand
        operation_name, operator = operation(test_case[:operator])

        expected = left_value.send(operator, right_value)
        expect(FluentCalculator.new.send(left_op).send(operation_name).send(right_op)).to be(expected)
      end
    end

    [
      { 'name': 'divides the left operand by the right operand', 'operator': :/, },
      # This test is disabled until modulus is implemented in the class
      # { 'name': 'returns the remainder of division of the left operand by the right operand', 'operator': :%, },
    ].each do |test_case|
      it "#{test_case[:name]}" do
        left_op, left_value = random_operand
        right_op, right_value = random_operand(:exclude_zero)
        operation_name, operator = operation(test_case[:operator])

        expected = left_value.send(operator, right_value)
        expect(FluentCalculator.new.send(left_op).send(operation_name).send(right_op)).to be(expected)
      end
    end

    [
      { 'name': 'raises ZeroDivisionError when dividing by zero', 'operator': :/, },
      # This test is disabled until modulus is implemented in the class
      # { 'name': 'raises ZeroDivisionError when using modulus and dividing by ', 'operator': :%, },
    ].each do |test_case|
      it "#{test_case[:name]}" do
        left_op, _ = random_operand
        operation_name, operator = operation(test_case[:operator])

        expect { FluentCalculator.new.send(left_op).send(operation_name).zero }.to raise_error(ZeroDivisionError)
      end
    end
   
  end

  # This section has been disabled until the class allows consumers to perform multiple 
  # operations AND the class overrides the equality operator
  xdescribe 'equality comparison' do
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
