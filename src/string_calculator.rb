class StringCalculator
  def add(numbers)
    entered_numbers = numbers.strip
    return 0 if entered_numbers.empty?

    sum = 0
    if entered_numbers.include?(',')
      splitted_array = entered_numbers.split(',')
      sum = splitted_array[0].to_i + splitted_array[1].to_i
    else
      sum = entered_numbers.to_i
    end
    
    sum
  end
end
