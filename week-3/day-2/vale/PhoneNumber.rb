#https://www.codewars.com/kata/create-phone-number/train/ruby

def createPhoneNumber(numbers)
    first_part = numbers[(0..2)].join("")
    second_part = numbers[(3..5)].join("")
    last_part = numbers[(6..9)].join("")  
    return "(#{first_part}) #{second_part}-#{last_part}"
end