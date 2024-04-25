# String Calculator

This is a simple string calculator implemented in Ruby.

## Description

The string calculator can add numbers provided as strings, including support for custom delimiters and handling negative numbers.

## Installation

To use this calculator, you need to have Ruby installed on your system. Clone this repository to your local machine.

## Running Tests

To run the tests, execute the following command in your terminal:

```ruby
ruby test_string_calculator.rb
```

# Examples

# Do addition of all numbers
calculator = StringCalculator.new
output = calculator.add("1,2,3")
puts output # it will be 6

# Use custom delimiter
calculator = StringCalculator.new
output = calculator.add("//;\n1;2;3")
puts output # it will be 6

# Use custom delimiter with more than one character
calculator = StringCalculator.new
output = calculator.add("//[***]\n1***2***3")
puts output # it will be 6

# Do Even index numbers addition
calculator = StringCalculator.new
output = calculator.add("1//;\n1;2;3")
puts output # it will be 4

# Do Odd index numbers addition
calculator = StringCalculator.new
output = calculator.add("0//;\n1;2;3")
puts output # it will be 2
