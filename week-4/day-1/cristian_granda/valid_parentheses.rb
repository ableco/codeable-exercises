def valid_parentheses(string)
  string.gsub!(/\w/,"")
  string.gsub!(/\s/,"")
  pairs_number = string.length
  pairs_number.times do |pair|
    string.gsub! '()', ''
  end
  string.length < 1
end