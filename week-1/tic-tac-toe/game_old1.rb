
puts "### Welcome to Tic tac toe ###"
puts "-> Your turn. You are X"

@winners = [
  Regexp.new(/^x...x...x$/),
  Regexp.new(/^..x.x.x..$/),
  Regexp.new(/^x..x..x..$/),
  Regexp.new(/^.x..x..x.$/),
  Regexp.new(/^..x..x..x$/),
  Regexp.new(/^xxx......$/),
  Regexp.new(/^...xxx...$/),
  Regexp.new(/^......xxx$/),
  Regexp.new(/^o...o...o$/),
  Regexp.new(/^..o.o.o..$/),
  Regexp.new(/^o..o..o..$/),
  Regexp.new(/^.o..o..o.$/),
  Regexp.new(/^..o..o..o$/),
  Regexp.new(/^ooo......$/),
  Regexp.new(/^...ooo...$/),
  Regexp.new(/^......ooo$/)
]

@row = 0
@column = 0
@current_game = [["-","-","-"],["-","-","-"],["-","-","-"]]
@turn = ""

def get_move_user
  @turn = "x"
  puts "Qué fila quieres?"
  @row = gets.to_i
  puts "Qué columna quieres?"
  @column = gets.to_i
  valid_move
end

def show_current_game
  (@turn == "x") ? (puts "Move user") : (puts "Move machine") 
  @current_game.each do |row|
    puts row.join(" ")
  end
end

def update_game()
  @current_game[@row][@column] = @turn
end

def compare_with_winners()
  winner = @winners.any? do |play_win|
    @current_game.join("") =~ play_win  
  end
  if winner
    puts "GAME OVER: WIN #{@turn}"
  else
    if @current_game.join("").count("-") == 0
      puts "GAME OVER: TIED MATCH"
      return true
    end
  end
  winner
end

def machine_turn
  @turn = "o"
  @row = Random.rand(0...3)
  @column = Random.rand(0...3)
  #puts "Jugada PC: #{@row}, #{@column}"
  valid_move
end

def valid_move
  if @current_game[@row][@column] === "-"
    update_game
  else
    get_move_user if @turn === "x"
    machine_turn if @turn === "o"
  end

end

def game
  get_move_user
  show_current_game
  return if compare_with_winners
  machine_turn
  show_current_game
  return if compare_with_winners
  game
end

game
