puts "1.TOP 5 MOST EXPENSIVE VEHICLES"
puts "2.TOP 5 TALLEST PEOPLE"
puts "3.TOP 5 MOST POPULATED PLANETS"
puts "4.TOP 5 HEAVY ONES"
puts "5.TOP 5 FASTEST VEHICLES"
puts "\n"
puts "INGRESA EL TOP QUE DESEAS VISUALIZAR"
puts "\n"
numero_top=gets.to_i

@expensive_array=[
    ["NOMBRES", "EDAD","OTRO VALOR"],
    ["paul ", "31","v1"],
    ["chris","15","v2"],
    ["nomb3", "37","v3"],
    ["nomb4", "32","v4"],
    ["nomb5", "27","v5"]
]

def put_inchart(num)
    case num
        when 1
            puts "MOST EXPENSIVE VEHICLES"
            print(@expensive_array)
        when 2
            puts "TALLEST PEOPLE"
        #put tallest_array in chart
        when 3
            puts "MOST POPULATED PLANETS"
        #put populated_array in chart
        when 4
            puts "HEAVY ONES"
        #put heavy_array in chart
        when 5
            puts "FASTEST VEHICLES"
        #put fastest_array in chart 
        else 
        puts "there is no top like that!"
    end
end

def print(array_imp)
 array_1,array_2,array_3,array_4,array_5,array_6=array_imp.each_slice(1).to_a
 #puts array_imp.each_slice(1).to_a.join(" | ")

 puts array_1.join(" | ")
 puts array_2.join(" | ")
 puts array_3.join(" | ")
 puts array_4.join(" | ")
 puts array_5.join(" | ")
 puts array_6.join(" | ")
 end

 put_inchart(numero_top)
