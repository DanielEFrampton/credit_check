require './lib/credit_card'

puts "Enter the digit corresponding to your chosen option: "
puts "1 - Validate a Visa, Mastercard, or American Express card number"
puts "2 - Calculate the check sum digit of an incomplete number"
menu_choice = gets.chomp

if menu_choice == "1"
  print "Enter a card number to validate: "
  input_number = gets.chomp

  test_card = CreditCard.new(input_number, 0)

  puts "The card number you input is #{if test_card.is_valid? == false then "in" end}valid."
elsif menu_choice == "2"
  print "Enter the incomplete card number to calculate the check sum digit for: "
  incomplete_card = CreditCard.new(gets.chomp, 0)

  puts "The valid checksum digit for the number you input is #{incomplete_card.generate_valid_checksum}."
  puts "The complete card number would be #{incomplete_card.card_number}#{incomplete_card.generate_valid_checksum}."
else
  puts "That was not one of the options; please retry and enter a number corresponding to an option."
end
