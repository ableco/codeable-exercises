climb-stairs = -> (num) do
return num if num=1
    
num.times{ puts "Step 1"}
end

puts climb-stairs.(4)