def createPhoneNumber(numbers)
  result = ""
  numbers.each_with_index do |number, i|
    case i
    when 0
      result += "(#{number}"
    when 2
      result += "#{number}) "
    when 5
      result += "#{number}-"
    else
      result += "#{number}"
    end
  end
  return result
end