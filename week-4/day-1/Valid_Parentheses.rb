
def valid_parentheses(string)
  re = /\(\)/
  string.gsub!(/[a-z]/,"")
  while re.match(string)
  string.gsub!(re,"")
  end
 if string == "" 
  return puts true 
 else puts !string end
end

#Extra solutions
# def valid_parentheses(string)
#   str = string.delete("^()")
#   while str.gsub!("()",''); end
#   str == '' 
#  end