class FluentCalculator
    
    OPERANDS = {
        'zero': 0, 
        'one': 1, 
        'two': 2, 
        'three': 3, 
        'four': 4, 
        'five': 5, 
        'six': 6, 
        'seven': 7, 
        'eight': 8, 
        'nine': 9
    }.freeze

    OPERATIONS = {
        'plus': :+,
        'minus': :-,
        'times': :*,
        'divided_by': :/,
        'modulus': :%,
        'to_the_power_of': :**
    }.freeze

    def initialize
        @result = 0
        create_operand_methods
        create_operation_methods
    end

    # To allow users to perform multiple operations in succession
    # uncomment the equality, and to string overrides below.
    # def ==(other)
    #     case other
    #     when FluentCalculator, String
    #         return self.to_s == other.to_s
    #     when Integer, Numeric
    #         return @result == other
    #     else 
    #         return false
    #     end
    # end
    #
    # def to_s
    #     return @result.to_s
    # end
    
    private

    def create_operand_methods
        OPERANDS.each do |number, value|
            define_singleton_method(number) do
                if (@operation.nil?)
                    @result = value
                    return self
                else
                    @result = @result.send(@operation, value)
                    return @result
                    # To allow users to perform multiple operations in succession
                    # (ex. FluentCalculator.new.one.plus.two.plus.three.etc... )
                    # remove the return statement above and uncomment the lines below.
                    # @operation = nil
                    # return self
                end
            end
        end
    end

    def create_operation_methods
        OPERATIONS.each do |name, operation|
            define_singleton_method(name) do
                @operation = operation
                return self
            end
        end
    end
end
  