A= [["-","-","-"],["-","-","-"],["-","-","-"]]


puts A[0].to_s
puts A[1].to_s
puts A[2].to_s

r=Random.new

humano=true

for turn in 1..9
    if humano
        puts "Que fila quieres?"
        x = gets.chomp.to_i

        puts "Que columna quieres?"
        y = gets.chomp.to_i
    else
        x=r.rand(1..3)
        y=r.rand(1..3)
    end

    while A[x-1][y-1] != "-"
        if humano
            puts "Que fila quieres?"
            x = gets.chomp.to_i
        
            puts "Que columna quieres?"
            y = gets.chomp.to_i
        else
            x=r.rand(1..3)
            y=r.rand(1..3)
        end
    end

    if humano
        A[x-1][y-1] = "X"
    else
        A[x-1][y-1] = "O"
    end

    if humano
        puts "----------Resultado del turno humano---------"
    else
        puts "----------Resultado del turno maquina--------"
    end
    puts A[0].to_s
    puts A[1].to_s
    puts A[2].to_s


   A.each{|fila| 
   if fila[0]==fila[1]&& fila [1]==fila[2]&&fila[0]!="-"
    if humano
        puts "The gamer X win"
     else
        puts "The gamer O win"
     end
    exit
   end
    }

    for columna in 0..2
        if A[0][columna]==A[1][columna]&& A[1][columna]==A[2][columna]&& A[0][columna]!="-"
            if humano 
                puts "The gamer X win"
             else
                puts "The gamer O win"
             end  
            exit
        end   
    end  

    if (A[0][0] == A[1][1] && A[1][1]==A[2][2]) or (A[0][2]== A[1][1] && A[1][1]==A[2][0]) && A[1][1]!= "-"
        if humano 
            puts "The gamer X win"
         else
            puts "The gamer O win"
         end
        exit  
    end

    humano = !humano

end