def validBraces(braces) 
  braces.delete("^()[]{}")    
  while !!(braces.gsub!("()","") || braces.gsub!("{}","") || braces.gsub!("[]","")); end  
  braces == ""  
end

puts validBraces("[(])")