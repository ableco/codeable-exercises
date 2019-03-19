def valid_parentheses(string)
    #your code here
    array_parentheses=[]
    b=string.split("")
    b.each do |x|
      if (x =="(" or x==")")
        array_parentheses << x
      end
    end

    array_final=[]
    array_parentheses.each do |item|
        if(item == "(")
            array_final << item
        else
            if(!array_final.empty? && array_final.last !=")")
                array_final.pop
            else
                array_final << item
            end
        end
    end
    #puts array_final
    array_final.empty?
end

# puts valid_parentheses("hol((aaa))))")