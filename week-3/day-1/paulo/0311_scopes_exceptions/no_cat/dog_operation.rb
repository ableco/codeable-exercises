require_relative "dog_class"

def operation(user_input, dog)
    
    # Devuelve true con el siguiente formato "cat > file.txt"
    if (user_input.scan(/^cat\s>\s\w+\.txt$/).any?)
      return "create file"
  
    # Devuelve true con el siguiente formato "cat >> file.txt"
    elsif (user_input.scan(/^cat\s>>\s\w+\.txt$/).any?)
      return "add file"
    
    # Devuelve true con el siguiente formato "cat file.txt"
    elsif (user_input.scan(/^cat\s\w+\.txt$/).any?)
      return "view file"

    # Devuelve true con el siguiente formato "cat file1.txt file2.txt"
    elsif (user_input.scan(/^cat\s\w+\.txt\s\w+\.txt$/).any?)
      return "concat file"

    # Devuelve true con el siguiente formato "cat file1.txt file2.txt > file3.txt"
    elsif (user_input.scan(/^cat\s\w+\.txt\s\w+\.txt\s>\s\w+\.txt$/).any?)
      return "concat and transfer file"

    else
      return "Error: Unexpected input"
    end
    
end