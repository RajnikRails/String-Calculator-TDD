require 'minitest/autorun'
require_relative 'string_calculator'

describe StringCalculator do
  describe "#add" do
    it "should returns zero if string is empty" do
      calculator = StringCalculator.new
      assert_equal 0, calculator.add("")
    end
  end
end
