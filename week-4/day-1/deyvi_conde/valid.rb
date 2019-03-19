def valid_parentheses(string)
    
  dataArray = string.chars 
  dataArray= dataArray.select { |caracter| caracter == "(" or caracter ==")"}


  dataArray.length.times do
    i = 0
    dataArray.each do |caracter|
      puts caracter
      if dataArray[i]=="(" && dataArray[i+1]==")"
        dataArray.delete_at(i)
        dataArray.delete_at(i)
      end
    i=i+1
    end
    
  end

  if dataArray.length==0
    return true
  else
    return false
  end

end
