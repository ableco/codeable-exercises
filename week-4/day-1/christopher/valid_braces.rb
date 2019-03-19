def valid_braces(string)
    #your code here
    array_braces=string.delete(' ').split("")

    array_final=[]
    array_braces.each do |item|
        if(item == "(" or item == "[" or item == "{")
            array_final << item
        else
            if(!array_final.empty?)
                if array_final.last=="[" && item =="]"
                    array_final.pop
                elsif array_final.last =="(" && item ==")"
                    array_final.pop
                elsif array_final.last =="{" && item =="}"
                    array_final.pop
                else
                    array_final << item
                end
            end
        end
    end
    #puts array_final
    array_final.empty?
end

#puts valid_braces("[(])")