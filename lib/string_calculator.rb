class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?
      nums = numbers.split(/,|\n/).map(&:to_i)
      delimiter = /,|\n/
      if numbers.start_with?("//")
        parts = numbers.split("\n", 2)
        custom_delimiter = parts[0][2..]
        delimiter = Regexp.escape(custom_delimiter)
        numbers = parts[1]
      end

      nums = numbers.split(/#{delimiter}/).map(&:to_i)
      nums.sum  
    end
end
  