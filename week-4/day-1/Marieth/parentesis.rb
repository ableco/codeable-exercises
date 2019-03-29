def valid_parentheses(string)
    #your code here

    dataArray = (string.gsub(/[a-zA-Z]/,"")).chars 
    puts dataArray.inspect

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
  
   return dataArray.empty?
    
  end


  Lista = ")(((hi)()("
  puts valid_parentheses(Lista)