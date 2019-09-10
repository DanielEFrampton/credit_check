# Your Luhn Algorithm Here

def validate(card_number)
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

  # Output
  puts "The number #{card_number} is #{if iterated_array.sum % 10 != 0 then "in" end}valid!"
end

# Test original valid number
validate("5541808923795240")

# Test 3 additional valid numbers
validate("5541808923795240")
validate("4024007136512380")
validate("6011797668867828")

# Test 3 additional invalid numbers
validate("5541801923795240")
validate("4024007106512380")
validate("6011797668868728")

# Test valid American Express card
validate("342804633855673")

# Test invalid American Express card
validate("342801633855673")
