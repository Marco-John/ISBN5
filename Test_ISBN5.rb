#ISBN5 Verification Program
  
#Create a program that will determine if a string is a valid ISBN-10 or ISBN-13 number is valid.

require 'minitest/autorun'
require_relative 'ISBN5.rb'

class TestIsbnChecker < Minitest::Test
	  
#1.  ISBN-10 is made up of 9 digits and and a check digit (which may be "x")
#2.  ISBN-13 is made up of 12 digits and a check digit
#3.  Remove spaces and hyphens from string

def test_string_without_10_or_13_numbers
		assert_equal(false, valid_isbn?("12345678"))
		assert_equal(false, valid_isbn?("12345678901234"))
end

def test_string_with_10_or_13_numbers
		assert_equal(true, valid_isbn?("0471958697"))
		assert_equal(true, valid_isbn?("9780470059029"))
end

def test_removing_spaces_and_hyphens
		assert_equal("0471958697", remove_spaces_and_hyphens_from_input_string("0471 958 697"))
		assert_equal("9780470059029", remove_spaces_and_hyphens_from_input_string("97  8047 0059029"))
				assert_equal("0471958697", remove_spaces_and_hyphens_from_input_string("0471 958-697"))
		assert_equal("9780470059029", remove_spaces_and_hyphens_from_input_string("97  8047 0059029"))
end

#ISBN-10

#4   ISBN10 may have "x" in last position
#5.  Multiply each digit by its position
#6.  Sum of all products of each position
#7.  Take modulo 11 of the result
#8.  If the modulo 11 result is 10, then "x" will be the last character in ISBN-10

def test_removing_x_from_last_position
		assert_equal("877195869", remove_x_if_in_last_position_on_isbn10("877195869x"))
		assert_equal("0471958697", remove_x_if_in_last_position_on_isbn10("0471958697"))
end

def test_invalid_characters_in_isbn
		assert_equal(false, invalid_characters_in_isbn("0471+9586A97"))
		assert_equal(false, invalid_characters_in_isbn("0471a9586*97"))
end

def test_adding_x_back_to_isbn
		assert_equal("877195869x", add_x_back_to_isbn("877195869"))
end

def test_isbn10_multiply_progression_and_modulus
		assert_equal(3, isbn10_multiply_progression_and_modulus("123"))
end

def test_valid_isbn10
		assert_equal(true, valid_isbn10?("0471958697"))
end
#ISBN-13

#9.  Multiply each digit alternately by 1 then 3
#10.  Sum of all products of each position
#11. Take modulo 10 of the result
#12. Subtract the modulo 10 result from 10
#13. Take modulo 10 of the Subtraction result to produce a single digit

end







