class StringCalculatorService
  class << self
    def add(numbers)
      return 0 if numbers.blank?
      numbers = unescape_input(numbers)

      raise RuntimeError, 'invalid input' if invalid_format?(numbers)

      parsed_numbers = parse_numbers(numbers)

      negatives = parsed_numbers.select { |number| number < 0 }
      raise RuntimeError, "negative numbers not allowed: #{negatives.join(", ")}" if negatives.any?

      parsed_numbers.sum
    end

    private

    def unescape_input(input)
      input.gsub(/\A"|"\Z/, '').gsub(/\\n/, "\n")
    end

    def invalid_format?(input)
      input.match?(/,\n\z/)
    end

    def parse_numbers(numbers)
      if numbers.start_with?("//")
        delimiter = numbers[2]
        numbers = numbers.split("\n", 2).last
        numbers.split(delimiter).map(&:to_i)
      else
        numbers.gsub(/\n/, ',').split(',').map(&:to_i)
      end
    end
  end
end
