class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    sum = 0
    delimiter = ","
   
    if numbers.start_with?("//")
      if numbers.include?("[") && numbers.include?("]")
        delimiter = numbers[/\[(.*?)\]/, 1]
        numbers = numbers[numbers.index("\n") + 1..]
      else
        delimiter = numbers[2]
        numbers = numbers[4..]
      end
    end
  
    numbers_arr = numbers.split(delimiter).reduce([]) do |arr, curr_str_no|
      arr + (curr_str_no.include?("\n") ? curr_str_no.split("\n") : [curr_str_no])
    end

    numbers_arr.each do |part|
      next if part.to_i > 1000
      if part.match?(/\D/)
        raise "Negatives not allowed : #{part}" if part.to_i.negative?
        sum += part.ord - 'a'.ord + 1
      else
        sum += part.to_i
      end
    end

    sum
  end
end
