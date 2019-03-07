puts "ingrese su operacion:"
op = gets.chomp
num = op.split(/(\d+\.?\d*)/).reject(&:empty?)
i=0
signos = ["+","-","*","/"]
while i < num.length
    if signos.include? (num[i])
        case num[i]
           when "**"
                res=num[i-1].to_i.send :**,num[i+1].to_i 
            when "/"
                res=num[i-1].to_i.send :/,num[i+1].to_i
            when "*"
               res=num[i-1].to_i.send :*,num[i+1].to_i
            when "+"
                res=num[i-1].to_i.send :+,num[i+1].to_i
            when "-"
                res=num[i-1].to_i.send :-,num[i+1].to_i                       
            else
                res=0;
        end
        num[i-1]=res
        num.delete_at(i)
        num.delete_at(i)
        i = i - 1 
    end
i = i+1
end
        
puts num.inspect