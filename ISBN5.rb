# ISBN5 Validator

def valid_isbn?(input_string)
  isbn_without_space_and_hyphens = remove_spaces_and_hyphens_from_input_string(input_string)
  correct_length?(isbn_without_space_and_hyphens)
end

def correct_length?(isbn_without_space_and_hyphens)
  if isbn_without_space_and_hyphens.length == 10
    true
  elsif isbn_without_space_and_hyphens.length == 13
    true
  else
    false
  end 
end


def valid_isbn10?(isbn_without_space_and_hyphens)
    isbn_without_x = remove_x_if_in_last_position_on_isbn10(isbn_without_space_and_hyphens)
    isbn_contain_all_numbers = invalid_characters_in_isbn(isbn_without_x)
    isbn_without_space_and_hyphens = add_x_back_to_isbn(isbn_without_x)
    isbn10_product = isbn10_multiply_progression_and_modulus(isbn_without_space_and_hyphens)    
    isbn10_check = isbn10_check_digit_equal_sum?(isbn_without_space_and_hyphens)
    isbn_contain_all_numbers == true && isbn10_check == true
end

#def valid_isbn13?(isbn_without_space_and_hyphens)
#    #code
#end

def remove_spaces_and_hyphens_from_input_string(input_string)
  input_string.delete!(" ")
  input_string.delete!("-")
  input_string
end

def remove_x_if_in_last_position_on_isbn10(input_string)
  if input_string[-1].upcase == "X"
     input_string.slice!(9)
  else
    input_string
  end
  input_string
end
#	array = input_string.split("")
#	if input_string.length == 10 && array[9] == "X" || array[9] == "x"
#		input_string.slice!(9)
#		input_string
#	else
#		input_string
#	end
#end

def invalid_characters_in_isbn(input_string)
  if input_string =~ /\D/
  	false
  else
  	true
  end
end

def add_x_back_to_isbn(input_string)
  #input_string = input_string.split("")
  if input_string.length == 9
    input_string + "x"
  else
  input_string
  end
end

def isbn10_multiply_progression_and_modulus(input_string)
	array = input_string.split("")
	sum = 0
	array.each_with_index do |value, position|
		break if position == 9
		sum += value.to_i * (position + 1)
	end
	sum = sum % 11
end

def isbn10_check_digit_equal_sum?(input_string)
	array = []
	array = input_string.split("")
	sum = isbn10_multiply_progression_and_modulus(input_string)
	if sum == 10 && array[9] == "X" || array[9] == "x"
		true
	elsif array[9].to_i == sum
		true
	else
		false
	end
end
