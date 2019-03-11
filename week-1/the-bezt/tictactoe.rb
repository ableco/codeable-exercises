  def tablero_nuevo
    @a1 = " "
    @a2 = " "
    @a3 = " "
    @b1 = " "
    @b2 = " "
    @b3 = " "
    @c1 = " "
    @c2 = " "
    @c3 = " "
  end
  
  def cuadrados
    [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  end

  def win_combos
    [[@a1, @a2, @a3],
    [@a1, @b2, @c3],
    [@a1, @b1, @c1],
    [@b1, @b2, @b3],
    [@c1, @c2, @c3],
    [@c1, @b2, @a3],
    [@a2, @b2, @c2],
    [@a3, @b3, @c3]]  
  end
  
  def imprimir_tablero
    puts
    puts "   1   2   3"
    puts "A  #{@a1} | #{@a2} | #{@a3} "
    puts "  ---|---|---"
    puts "B  #{@b1} | #{@b2} | #{@b3} "
    puts "  ---|---|---"
    puts "C  #{@c1} | #{@c2} | #{@c3} "
    puts
    verif_ganador
  end

  def check_disp disp_cuadrado
    if disp_cuadrado == " "
      true
    else
      puts "El espacio está tomado, prueba otro!"
      false
    end
  end
  
  def turno_user
    hash_dec_usuario = {"a1" => @a1,
                        "a2" => @a2,
                        "a3" => @a3,
                        "b1" => @b1,
                        "b2" => @b2,
                        "b3" => @b3,
                        "c1" => @c1,
                        "c2" => @c2,
                        "c3" => @c3}    
    
    jugada_correcta = false

    until jugada_correcta do 
    puts "Por favor selecciona un espacio : "
    dec_usuario = gets.chomp.downcase

    hash_dec_usuario.each do |elec, cuadrado|
      if dec_usuario == elec
        if check_disp(cuadrado)
          cuadrado.sub!(" ", "X")
          imprimir_tablero
          jugada_correcta = true
        else
            jugada_correcta = false

        end
      elsif dec_usuario == "q" or dec_usuario == "quit"
        exit
      end
    end
    end
  end


  def turno_computadora
    cuadrados.shuffle.each do |cuadrado|
      if check_disp(cuadrado)
        cuadrado.gsub!(" ", "O")
        break
      end
    end
  end
  
  def verif_ganador
    win_combos.each do |combos|
      if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
        puts "Computadora gana! Buena suerte a la próxima."
        exit
      elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
        puts "Ganaste! Buen trabajo!"
        exit      
      end
    end
  end  
  
  def ini_juego
    puts "Bienvenido a TIC TAC TOE!"
    puts "Para poner tu 'X', ingresa el lugar (ex--a1, b3)."
    puts "Para salir, ingresa q o quit cuando quieras"
  end
  
  def corre_juego
    ini_juego
    tablero_nuevo
    while true
      imprimir_tablero
      turno_user
      turno_computadora 
    end
  end  

corre_juego
