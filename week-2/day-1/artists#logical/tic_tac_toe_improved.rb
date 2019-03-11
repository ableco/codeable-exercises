require 'colorize'
#Variables generales
step_jugadas = 0
array_no_opciones = []

def creation_solution
    index_final = @num_board**2 - 1
    @array_jugadas_winner = []
    
    arr_vertical = Array.new(@num_board) { Array.new }
    con_v = 0

    arr_horizontal = []

    arr_diagonal = Array.new(2) { Array.new }
    
    for i in 0..index_final
        #Creando soluciones del michi horizontales
        arr_horizontal.push(i)

        #Creando soluciones del michi verticales
        arr_vertical[con_v].push(i)
        con_v += 1

        #Creando soluciones del michi diagonales
        arr_diagonal[0].push(i) if i % (@num_board + 1) == 0
        arr_diagonal[1].push(i) if i > 0 && i < index_final && (i % (@num_board - 1) == 0)

        if (i+1) % @num_board == 0
            @array_jugadas_winner.push(arr_horizontal)
            arr_horizontal=[]
            con_v = 0
        end
    end
    # puts @array_jugadas_winner.to_s
    # puts arr_vertical.to_s
    # puts arr_diagonal.to_s

    @array_jugadas_winner = @array_jugadas_winner + arr_vertical + arr_diagonal
end

def creation_board (arr)
    num_arr=arr.length - 1
    tablero = ""
    for i in (0..num_arr)
        posicion = "  " + (i+1).to_s
        move = false
        case arr[i]
            when "1"
                posicion = "  x".blue
                move = true
            when "0"
                posicion = "  o".red
                move = true
        end
        
        if i < num_arr
            if (i + 1) % @num_board == 0
                posicion += "\n" + "-"*(@num_board*6-1) +"\n"
            else
                posicion += " "
                if !move
                    if (i+1)>9
                        posicion += "|"
                    else
                        posicion += " |"
                    end
                else
                    posicion += " |"
                end
            end
        end
        tablero += posicion
    end
    tablero
end

def validate_winner (arr, last_player)
    num_elem_winner = @array_jugadas_winner.length - 1
    for i in 0..num_elem_winner
        list = arr.select.with_index{|n,m| @array_jugadas_winner[i].include?(m)}
        if ( list  == Array.new(@num_board,"1") || list == Array.new(@num_board,"0"))
            return last_player
        end
    end
    return ""
end


#Juego
puts "Bievenido al juego #️⃣  🐱  !!\n\n"
puts "----------------------------------"
puts "Elige el tamaño de tu tablero (3-9)"
loop do
    @num_board=gets.chomp.to_i
    break if @num_board >= 3 && @num_board <= 9
    puts "Ingrese un valor correcto\n" + "Elige el tamaño de tu tablero (3-9)"
end
tamanio_final=@num_board**2
@array_opciones=(1..tamanio_final).to_a
array_jugadas = Array.new(tamanio_final,"")
creation_solution
puts "\n\nEmpecemos a jugar\n\n"
msj_inicio = "Elige un número del tablero para hacer tu jugada\n\n"
board = creation_board(array_jugadas)
puts msj_inicio + board + "\n\n"
jugada = 0
loop do
    jugada = gets.chomp.to_i
    break if jugada > 0 && jugada <(tamanio_final+1)
    puts "Ingrese un valor correcto\n" + msj_inicio + board
end
array_jugadas[jugada-1] = "1"
array_no_opciones.push(jugada)
board = creation_board (array_jugadas)
step_jugadas += 1
puts "\n" + board + "\n\n"
msj_computador = "El computador esta jugando\n\n"
msj_persona = "Continua tu jugada, elige un número del tablero\n\n"
result = ""
for n in (1..((@array_opciones.length - 1)/2))
    system "clear"
    if step_jugadas >= 5
        result = validate_winner(array_jugadas, "1")
        if result != ""
            puts "El ganador eres tú!!! 🎉  🙌  🙌  🎉"
            break
        end
    end
    puts msj_computador
    jugada_computador = (@array_opciones-array_no_opciones).sample
    array_jugadas[jugada_computador-1] = "0"
    array_no_opciones.push(jugada_computador)
    board = creation_board (array_jugadas)
    step_jugadas += 1
    puts "\n" + msj_persona + board + "\n\n"
    if step_jugadas >= (@num_board * 2 - 1)
        result = validate_winner(array_jugadas, "0")
        if result != ""
            puts "El ganador es el computador!!! 😓  😓  Intentalo la proxima vez"
            break
        end
    end
    jugada = 0
    loop do
        jugada = gets.chomp.to_i
        if array_no_opciones.include?(jugada)
            puts "Esa posición esta usada\n"
        elsif jugada > 0 && jugada <(tamanio_final+1)
            break
        end
        puts "Ingrese un valor correcto\n" + msj_persona + board
    end
    array_jugadas[jugada-1] = "1"
    array_no_opciones.push(jugada)
    board = creation_board (array_jugadas)
    step_jugadas += 1
    puts "\n" + board + "\n\n"
end
if result == ""
    result = validate_winner(array_jugadas, "1")
    puts "El ganador eres tú!!! 🎉  🙌  🙌  🎉" if result != ""
end
puts "Empataron!! 🤷‍♂️  🤷‍♂️" if (step_jugadas == tamanio_final) && (result == "")