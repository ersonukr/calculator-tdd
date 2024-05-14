class CalculatorService
  def self.add(string)
    return 0 if string.empty?

    delimiter = ","
    if string.start_with?("//")
      delimiter = string[2]
      string = string[4..-1]
    end

    unless string.match(/^(-?\d+#{delimiter})*-?\d+(\n)?(-?\d+)?$/)
      raise ArgumentError, "Invalid input format"
    end

    numbers = string.split(/#{delimiter}|\n/).map(&:to_i)
    raise ArgumentError, "Invalid input format" if numbers.include?(nil) # Check for invalid conversion to integer

    numbers.sum
  end 
end  
