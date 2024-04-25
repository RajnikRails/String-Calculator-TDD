class StringCalculator
  def add(numbers)
    entered_numbers = numbers.strip
    return 0 if entered_numbers.empty?
    return entered_numbers.to_i
  end
end
