def create_phone_number(numbers)
  numbers.join.gsub /(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3'
end

p create_phone_number(Array[1, 2, 3, 4, 5, 6, 7, 8, 9, 0])