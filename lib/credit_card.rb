class CreditCard
  attr_reader :card_number, :limit

  def initialize(card_num, card_limit)
    @card_number = card_num.to_s
    @limit = card_limit.to_i
  end

  # Returns either true or false based on whether or not the card number is valid
  def is_valid?
    # Declare array variable for use in iterative block
    iterated_array = []

    # Split card_number into an array, iterate to double even indexes, and assign to variable
    card_number.chars.each_with_index do |number, index|
      # Look for digit to left of final digit and every second digit moving left.
      if (index - card_number.length).even?
        # If so, return doubled value
        doubled_number = card_number.chars[index].to_i * 2
        # Check if resulting number greater than 9 (i.e., double digits)
        if doubled_number > 9
          # If so, subtract 9 (equivalent to adding the two digits)
          doubled_number -= 9
        end
        # Push to array
        iterated_array << doubled_number
      # If not even index value...
      else
        # Push unmodified number to array
        iterated_array << number.to_i
      end
    end

    # Return true or false result of following boolean comparison
    iterated_array.sum % 10 == 0
  end

  def generate_valid_checksum
    # Declare array variable for use in iterative block
    iterated_array = []

    # Split card_number into an array, iterate to double even indexes, and assign to variable
    card_number.chars.each_with_index do |number, index|
      # Look for digit to left of final digit and every second digit moving left.
      if (index - card_number.length).odd?
        # If so, return doubled value
        doubled_number = card_number.chars[index].to_i * 2
        # Check if resulting number greater than 9 (i.e., double digits)
        if doubled_number > 9
          # If so, subtract 9 (equivalent to adding the two digits)
          doubled_number -= 9
        end
        # Push to array
        iterated_array << doubled_number
      # If not even index value...
      else
        # Push unmodified number to array
        iterated_array << number.to_i
      end
    end
    # Return value of following expression: what modified sum needs to create sum divisible by 10
    if (iterated_array.sum % 10) > 0
      # If greater than zero, difference from 10
      10 - (iterated_array.sum % 10)
    else
      # If zero, return zero (otherwise above calculation would try to return 10)
      0
    end
  end

  # Returns a String of the last four digits of card number
  def last_four
    card_number.slice(-4,4)
  end
end
