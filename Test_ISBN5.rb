#ISBN5 Verification Program
  
#Create a program that will determine if a string is a valid ISBN-10 or ISBN-13 number is valid.

require 'minitest/autorun'
require_relative 'ISBN5.rb'

class TestIsbnChecker < Minitest::Test
	  
#1.  ISBN-10 is made up of 9 digits and and a check digit (which may be "x")
#2.  ISBN-13 is made up of 12 digits and a check digit
#3.  Remove spaces and hyphens from string

#ISBN-10

#4.  Multiply each digit by its position
#5.  Sum of all products of each position
#6.  Take modulo 11 of the result
#7.  If the modulo 11 result is 10, then "x" will be the last character in ISBN-10

#ISBN-13

#8.  Multiply each digit alternately by 1 then 3
#9.  Sum of all products of each position
#10. Take modulo 10 of the result
#11. Subtract the modulo 10 result from 10
#12. Take modulo 10 of the Subtraction result to produce a single digit

end







