class Player
	attr_reader :name
	attr_reader :symbol
	attr_accessor :game
	# attr_accessor :last_move

	def initialize(name, symbol)
		@name = name
		@game = "---------"
		@symbol = symbol
		# @last_move = nil
	end

	def update_game(move)
		@game[move] = "x" if move
	end
end