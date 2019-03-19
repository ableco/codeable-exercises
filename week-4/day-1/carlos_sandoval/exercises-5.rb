def valid_parentheses(string)
    string.gsub!(/[^()]/, "")  
    loop do
      break unless string.gsub!("()", "")
    end
   string.empty? ? true : !string 
end