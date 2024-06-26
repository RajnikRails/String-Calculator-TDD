require 'minitest/autorun'
require_relative 'string_calculator'

def get_sum_from_string_arr(arr)
  arr.reduce(0) do |sum, curr_str_no|
    if curr_str_no.match?(/\D/)
      sum + (curr_str_no.ord - 'a'.ord + 1)
    else
      sum + curr_str_no.to_i
    end
  end
end

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
      expected_value = get_sum_from_string_arr(input_value.split(','))
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end

    it "should return the addition of entered unlimited numbers separated by a comma" do
      input_value = "1,2,3,4,5"
      expected_value = get_sum_from_string_arr(input_value.split(','))
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end

    it "should return addition of entered numbers along with alphabets(take its position value) separated by ','" do
      input_value = "1,2,b,4,a"
      expected_value = get_sum_from_string_arr(input_value.split(','))
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end

    it "should throw an error if entered numbers contain one negative number" do
      input_value = "1,-2"
      expected_error_message = "Negatives not allowed : -2"
      result_func = -> { @string_calculator.add(input_value) }
      assert_raises(RuntimeError, expected_error_message) { result_func.call }
    end

    it "should throw an error if entered numbers contain multiple negative numbers" do
      input_value = "1,-3,-4,-5"
      expected_error_message = "Negatives not allowed : -3,-4,-5"
      result_func = -> { @string_calculator.add(input_value) }
      assert_raises(RuntimeError, expected_error_message) { result_func.call }
    end

    it "should return the addition of entered numbers that are less than 1000" do
      input_value = "1,2,3999,5000"
      expected_value = get_sum_from_string_arr(input_value.split(',').select { |curr_no| curr_no.to_i < 1000 })
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end
    
    it "should return the addition of numbers separated by ',' or '\\n'" do
      input_value = "1\n2,3"
      expected_value = get_sum_from_string_arr(input_value.split(/,|\n/))
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end   
    
    it "should return the addition of numbers with entered delimiter like '//[delimiter]\\n[numbers…]' and delimiter length is 1" do
      string_numbers = "1;2;3"
      delimiter = ";"
      input_value = "//#{delimiter}\n#{string_numbers}"
      expected_value = get_sum_from_string_arr(string_numbers.split(delimiter))
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end    

    it "should return the addition of numbers with entered delimiter like '//[delimiter]\\n[numbers...]' and delimiter length is unlimited" do
      delimiter = "***"
      string_numbers = "1#{delimiter}2#{delimiter}3"
      input_value = "//[#{delimiter}]\n#{string_numbers}"
      expected_value = get_sum_from_string_arr(string_numbers.split(delimiter))
      result_value = @string_calculator.add(input_value)
      assert_equal expected_value, result_value
    end

    it 'should return addition of odd indices if string starts with "0//"' do
      delimiter = '***'
      string_numbers = "1#{delimiter}2#{delimiter}3#{delimiter}"
      input_value = "0//#{delimiter}\n#{string_numbers}"
      expected_value = string_numbers.split(delimiter).map(&:to_i).each_with_index.reduce(0) do |sum, (curr_str_no, curr_idx)|
        curr_idx.odd? ? sum + curr_str_no : sum
      end
      result_value = @string_calculator.add(input_value)
      _(result_value).must_equal expected_value
    end

    it 'should return addition of even indices if string starts with "1//"' do
      delimiter = '***'
      string_numbers = "1#{delimiter}2#{delimiter}3#{delimiter}"
      input_value = "1//#{delimiter}\n#{string_numbers}"
      expected_value = string_numbers.split(delimiter).map(&:to_i).each_with_index.reduce(0) do |sum, (curr_str_no, curr_idx)|
        curr_idx.even? ? sum + curr_str_no : sum
      end
      result_value = @string_calculator.add(input_value)
      _(result_value).must_equal expected_value
    end
  end
end
