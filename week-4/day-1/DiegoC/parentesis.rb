def valid_parentheses(s)
  s = s.gsub(/[^()]/, '')
  
  st = []
  s.chars.each do |x|
    if x == '('
      st.push ')'
    elsif st.pop != x
      return false
    end
  end
  st.empty?
end