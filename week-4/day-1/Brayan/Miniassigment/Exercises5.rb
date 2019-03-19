def valid_parentheses(string)
  pair = {"(" => 1, ")" => -1}
  sum = 0
  string.chars.each do |val|
    sum += pair[val] if pair.key?(val)
    return false if sum < 0
  end
  sum == 0
end