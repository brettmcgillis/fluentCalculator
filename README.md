# fluentCalculator
This repository contains code for a calculator class that provides a fluent api, and is written in Ruby.

### Requirements
> The goal is to implement a simple calculator which uses fluent syntax:
> There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).
> Each calculation consists of one operation only and will return an integer.

#### Assumptions
- Additional arithmetic operations and/or operands may be required in future iterations.
- Future iterations may allow multiple operations to be performed but will not retroactively apply appropriate orders of operations.  

## Getting Started
Get started by navigating to the project directory and installing the requisite gems.

```
cd fluentCalculator
bundle install
```

## Testing
This project uses RSpec for testing. To run tests:

```
cd fluentCalculator
bundle exec rspec
```