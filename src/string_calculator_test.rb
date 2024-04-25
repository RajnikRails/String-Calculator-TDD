require 'minitest/autorun'
require_relative 'string_calculator'

describe StringCalculator do
  describe "#add" do
    before :all do
      @string_calculator = StringCalculator.new
    end

    it "should returns zero if string is empty" do
      input_value = ""
      expected_value = input_value.to_i
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end

    it "should returns the number itself if only one number is entered as argument" do
      input_value = "2"
      expected_value = input_value.to_i
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end

    it "should return the addition of two numbers separated by a comma" do
      input_value = "1,2"
      expected_value = input_value.split(',').map(&:to_i).sum
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end
  end
end
