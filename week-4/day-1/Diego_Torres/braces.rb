def validBraces(braces)
  stack = []
  open = ["(","[","{"]
  
  braces.each_char do |x|
    stack.push(x) if open.include?(x)  
    if x == ")"
      if (stack.last == "(" && stack.last == "(")
        stack.pop
      else
        return false
      end
    elsif x == "]"
      if (stack.last == "[" && stack.last == "[")
        stack.pop
      else
        return false
      end
    elsif x == "}"
      if (stack.last == "{" && stack.last == "{")
        stack.pop
      else
        return false
      end
    end
  end
  stack.empty?
end

puts validBraces( "[(])" ) #false
puts validBraces( "[[{}]]" ) #true
puts validBraces( "((()))[]{}((){})" ) #true
puts validBraces( "[({(({{[[]]}}))})]" ) #true
puts validBraces( "][" ) #false
puts validBraces( "()()()())" ) #false
puts validBraces( "{}{{{}}}(())[][]" ) #true