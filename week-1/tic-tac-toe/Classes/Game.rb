class Game
  WINNING_PLAYS = [
    Regexp.new(/^xxx|xxx$|...xxx.../),    # rows
    Regexp.new(/x..x..x/),                # columns
    Regexp.new(/x...x...x/),              # diagonal 1
    Regexp.new(/..x.x.x../)               # diagonal 2
  ]

  attr_accessor :game

  def initialize(player1, player2)
    @last_move = nil
    @players = {
      player1: player1,
      player2: player2
    }
    @current_player = @players[:player2]
    @game = "---------"
  end

  def run_game
    change_player
    get_move
    update_games
    show_game
    run_game unless game_over?
  end

  def change_player
    if @current_player == @players[:player2]
      @current_player = @players[:player1]
    else
      @current_player = @players[:player2]
    end
  end

  def get_move
    move = @current_player.move
    #validation
    (@game[move] === "-") ? (@last_move = move) : (get_move)
  end

  def update_games
    @current_player.game[@last_move] = "x"
    @game[@last_move] = @current_player.symbol
  end

  def show_game
    system "clear"
    puts "1 2 3  |  #{@game[0]} #{@game[1]} #{@game[2]}"
    puts "4 5 6  |  #{@game[3]} #{@game[4]} #{@game[5]}"
    puts "7 8 9  |  #{@game[6]} #{@game[7]} #{@game[8]}"
  end

  def game_over?
    winner = WINNING_PLAYS.any? do |play_win|
      @current_player.game =~ play_win
    end
    if winner
      puts "Game over: #{@current_player.name} WIN"
      return true
    elsif @game.count("-") == 0
      puts "Game over: TIED MATCH"
      return true
    end
    false
  end

end