# ISBN5 Validator

def valid_isbn?(input_string)
  remove_spaces_and_hyphens_from_input_string(input_string)
  correct_length?(input_string)
end

def correct_length?(input_string)
  if input_string.length == 10
    true
  elsif input_string.length == 13
    true
  else
    false
  end 
end

def remove_spaces_and_hyphens_from_input_string(input_string)
  input_string.delete!(" ")
  input_string.delete!("-")
  input_string
end

def remove_x_if_in_last_position_on_isbn10(input_string)
  if input_string[-1] == "x"
    input_string.slice!(9)
  else
    input_string
  end
  input_string
end

def invalid_characters_in_isbn(input_string)
  if input_string =~ /\D/
  	false
  else
  	true
  end
end