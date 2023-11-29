# fluentCalculator
This repository contains code for a calculator class that provides a fluent api, and is written in Ruby.

### Requirements
> The goal is to implement a simple calculator which uses fluent syntax
> There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).
> Each calculation consists of one operation only and will return an integer.

#### Assumptions
- Additional arithmetic operations and/or operands may be required in future iterations.
- Future iterations may allow multiple operations to be performed but will not retroactively apply appropriate orders of operations.  

## Getting Started
Get started by navigating to the project directory and installing the requisite gems.

```bash
cd fluentCalculator
bundle install
```

## Using FluentCalculator
The FluentCalculator class allows consumers to perform basic arithmetic using fluent syntax. Functions are provided for inputing integer values between 0 and 9. Functions are provided to allow the consumer to add, subtract, multiply and divide. When performing division integer values are returned. 

``` ruby
# Arithmetic
puts FluentCalculator.new.one.plus.two # 3
puts FluentCalculator.new.three.plus.four # 7
puts FluentCalculator.new.five.minus.six # -1
puts FluentCalculator.new.seven.times.eight # 56
puts FluentCalculator.new.nine.divided_by.two # 4

# Equality
puts FluentCalculator.new.one.times.five == 5 # true
puts FluentCalculator.new.one.times.five == FluentCalculator.new.two.plus.three # true

#Errors
puts FluentCalculator.new.five.divided_by.zero # Raises ZeroDivisionError
```


## Testing
This project uses RSpec for testing. To run tests:

```bash
cd fluentCalculator
bundle exec rspec
```