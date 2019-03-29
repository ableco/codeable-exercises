def valid_parentheses(string)
  while !!(/\(\w*\)/ =~ string) do
    string.gsub!(/\(\w*\)/, "")
  end
  !string.include?("(") && !string.include?(")")
end

puts valid_parentheses("hi(hi)()")