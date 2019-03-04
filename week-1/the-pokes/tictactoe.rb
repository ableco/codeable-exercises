puts "---- Bienvenidos a Tic Tac Toe Codeable ----"
puts "Reglas del juego:"
puts "--------------------------------------------"
puts "1. Los jugadores eligiran la posicion donde
  marcaran"
puts "--- Tablero ---"

puts "\n 1 | 2 | 3 "
puts "-----------"
puts " 4 | 5 | 6 "
puts "-----------"
puts " 7 | 8 | 9 "

puts "\nEmpecemos!!!"

puts "\n   |   |   "
puts "-----------"
puts "   |   |   "
puts "-----------"
puts "   |   |   "

COMBINATIONS_WIN = [
  [1,2,3],  
  [4,5,6],
  [7,8,9],
  [1,4,7],
  [2,5,8],
  [3,6,9],
  [1,5,9],
  [3,5,7]
]

TABLE = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9
]

def notPlayed(value)
  arrNP = TABLE - value
  return arrNP 
end

def turnHuman(notplayed)
    value = 0
    loop do
      puts "\nEs el turno del Humano"
      value = gets.chomp.to_i
      break if ( ( notplayed.include?(value)) && (value >= 1) && (value <=9) )
    end
    return value
end

def turnBot(value)
  if(value != [])
    value.sample
  end
end

def tictactoe()
  
  value_human = []
  value_bot = []

  band = false

  player = "X"
  bot = "O"

  table = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  while (band == false) do


    # pos_human : Es el valor que ingresa el usuario
    pos_human = turnHuman(notPlayed(value_human+value_bot)).to_i
    table[pos_human-1] = player
    value_human.push(pos_human)
    

    pos_bot = turnBot(notPlayed(value_human+value_bot)).to_i
    table[pos_bot-1] = bot
    value_bot.push(pos_bot)

    # player == "X" ? value_human.push(pos) : value_bot.push(pos)

    puts "\n #{table[0]} | #{table[1]} | #{table[2]} "
    puts "-----------"
    puts " #{table[3]} | #{table[4]} | #{table[5]} "
    puts "-----------"
    puts " #{table[6]} | #{table[7]} | #{table[8]} "

    puts "Soy un hum #{value_human}"
    puts "Soy un bot #{value_bot}"
    puts "NO JUGADAS #{notPlayed(value_human+value_bot)}"
    
    for i in 0..COMBINATIONS_WIN.length-1
      
      if ( (COMBINATIONS_WIN[i] - value_human) == [] )
        puts "El indescutible ganador!! es el HUMANO #{player}"
        return band = true 
      elsif ( (COMBINATIONS_WIN[i] - value_bot) == [] )
        puts "El indescutible ganador!! es el BOT #{player}"
        return band = true 
      end
      
    end

  end

end

puts tictactoe()