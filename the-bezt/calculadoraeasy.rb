begin
    puts eval(gets.chomp)
  rescue SyntaxError
    puts "Error: Parenthesis is not closed"
  rescue ZeroDivisionError
    puts "Error: Zero division is not allowed"
  rescue NameError
    puts "Error: Verify input"
end
