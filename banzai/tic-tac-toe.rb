=begin
  colorize gem required to play game
  gem install colorize
=end
require 'colorize' 

$level = 2

def draw_field(val, index)
  (val.is_a? Integer) ? (index + 1 < 10 ? " #{val}" : val) : " #{val}"
end

def draw_cell(cell, index)
  return draw_field(index + 1, index).to_s.white if cell == 0
  return draw_field("O", index).yellow if cell == -1
  return draw_field("X", index).blue if cell == 1
end

def draw_tic(arr)
  size_line = 5 * $level + 1
  line, col = "-".green, "|".green
  border = line * size_line
  total = border
  row = col
  arr.each_with_index do |cell, index|
    content = draw_cell(cell, index)
    row = row + " #{content} #{col}"
    if ((index + 1) % $level == 0)
      total = total + "\n" + row + "\n" + border
      row = col
    end
  end
  puts total
end

def finish_game?(arr)
  arr.include?(0)
end

def get_index(arr, val)
  arr.map.with_index { |num, index| index if num == val}.compact
end

def who_wins?(g_state)
  board = [*0..$level**2 -1].each_slice($level).to_a
  winConditions = board + board.transpose
  diag = (0..(board.count - 1)).collect { |i| board[i][i] }
  diag2 = (0..(board.count - 1)).collect { |i| board.reverse[i][i] }.reverse
  winConditions.push(diag, diag2)

  winConditions.each_with_index do |win, index|
    return 'x' if (win - get_index(g_state, 1)).empty?
    return 'o' if (win - get_index(g_state, -1)).empty?
  end

  return '-'
  
end

def turn_machine(arr)
  # next level => integrate IA
  positions = []
  arr.each_with_index do |num, index|
    positions.push(index) if num == 0
  end
  positions.sample
end

def main
  while true
    game_state = Array.new($level ** 2, 0)
    band = true
    winner = '-'
    while finish_game?(game_state)
      system "clear"
      puts "Level #{$level}"
      if band
        draw_tic game_state
        index = 0
        loop do 
          puts "Elige una opcion:"
          index = gets.chomp.to_i
          break if  game_state[index - 1] == 0
          puts index > $level**2 ? "Elige un numero del 1 al #{$level**2}".red : "Opcion repetida".red
        end
        game_state[index - 1] = 1
        band = false
      else
        game_state[turn_machine(game_state)] = -1 
        band = true
      end
      winner = who_wins? game_state
      break if winner != '-'
    end
    system "clear"
  
    draw_tic game_state
    if (winner == '-')
      puts "Empataste"
    else
      if winner == "x"
        puts "Ganaste tio, alegrate".cyan
        $level = $level + 1
      else
        puts "Acabas de perder con una maquina".red
        break
      end
    end
    sleep(1.5)
  end
end

# execute program
main
