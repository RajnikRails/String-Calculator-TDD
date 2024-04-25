class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    sum = 0
    numbers.split(',').each do |part|
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
