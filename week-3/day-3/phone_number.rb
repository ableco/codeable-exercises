def createPhoneNumber(numbers)
  code = numbers[(0..2)].join("")
  section_1 = numbers[(3..5)].join("")
  section_2 = numbers[(6..9)].join("")  
  return "(#{code}) #{section_1}-#{section_2}"
end

puts createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])