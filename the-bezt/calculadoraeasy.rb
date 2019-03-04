begin
    puts eval(gets.chomp)
  rescue SyntaxError=>e
    puts "Error: Parenthesis is not closed"
  rescue ZeroDivisionError =>e
    puts "Error: Zero division is not allowed"
end