Lista = ')(((hi)()('

def valid_parentheses(string)
    
  dataArray = (string.gsub(/[a-zA-Z]/,"")).chars 

  puts dataArray.inspect

  array_reducido=[]
  opposite ={"(" => ")"}

  dataArray.each do |caracter|
    if caracter=="("
      array_reducido << caracter 
    else
    array_reducido.last ==  opposite[caracter] ? array_reducido << caracter : array_reducido.pop
    end
  end

  puts array_reducido.inspect
  puts array_reducido.empty?

end

valid_parentheses(Lista)