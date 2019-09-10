require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_card'

class CreditCardTest < Minitest::Test

  def test_it_exists
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_instance_of CreditCard, credit_card
  end

  def test_it_validates_valid_numbers
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal true, credit_card.is_valid?
  end

  def test_it_invalidates_invalid_numbers
    credit_card = CreditCard.new("5541808923795241", 15000)
    assert_equal false, credit_card.is_valid?
  end

  def test_it_validates_valid_american_express_number
    credit_card = CreditCard.new("342804633855673", 15000)
    assert_equal true, credit_card.is_valid?
  end

  def test_it_invalidates_invalid_american_express_numbers
    credit_card = CreditCard.new("342801633855673", 15000)
    assert_equal false, credit_card.is_valid?
  end

  def test_it_gives_last_four_digits
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal "5240", credit_card.last_four
  end

  def test_it_has_limit_value_getter
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal 15000, credit_card.limit
  end

  def test_it_has_card_number_getter
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal "5541808923795240", credit_card.card_number
  end

  def test_it_has_string_value_for_credit_card_number
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal String, credit_card.card_number.class
  end

  def test_it_has_integer_value_for_limit
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal Integer, credit_card.limit.class
  end

  def test_it_generates_single_checksum_digit
    credit_card = CreditCard.new("5541808923795240", 15000)
    assert_equal true, /\d/.match?(credit_card.generate_valid_checksum.to_s)
  end

  def test_it_generates_valid_checksum_digit
    credit_card_partial = CreditCard.new("123456789", 0)
    credit_card_complete = CreditCard.new(credit_card_partial.card_number + credit_card_partial.generate_valid_checksum.to_s, 0)
    assert_equal true, credit_card_complete.is_valid?
  end
end
