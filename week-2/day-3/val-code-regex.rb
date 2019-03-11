# Exercise in https://www.codewars.com/kata/validate-code-with-simple-regex/train/ruby

def validate_code(code)
  if (/^[1-3]\d+/.match(code.to_s))
    return true
  end
  false
end

puts validate_code(123)
puts validate_code(248)
puts validate_code(8)
puts validate_code(321)
puts validate_code(9453)