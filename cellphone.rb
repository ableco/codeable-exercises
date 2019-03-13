# createPhoneNumber(Array[1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # => returns "(123) 456-7890"
# The returned format must be correct in order to complete this challenge. 
# Don't forget the space after the closing parentheses!


def createPhoneNumber(numbers)
    phone_num = numbers.join(",").to_s.gsub(",","")
    return "(#{$1})#{$2}-#{$3}" if phone_num =~ /^(\d{3})(\d{3})(\d{4})$/
end

puts createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])
