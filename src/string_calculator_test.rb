require 'minitest/autorun'
require_relative 'string_calculator'

describe StringCalculator do
  describe "#add" do
    it "should returns zero if string is empty" do
      calculator = StringCalculator.new
      assert_equal 0, calculator.add("")
    end

    it "should returns the number itself if only one number is entered as argument" do
      calculator = StringCalculator.new
      input_value = "2"
      expected_value = input_value.to_i
      result_value = calculator.add(input_value)
      assert_equal expected_value, result_value
    end
  end
end
