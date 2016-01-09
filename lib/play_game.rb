require_relative './tic_tac_toe.rb'

puts "\n\nWelcome to ZL's edition of Tic Tac Toe"

# Which Game mode?
puts "\nPlease choose a game mode:\n1: Human vs Human\n2: Human vs Computer\n3: Computer vs Computer\n"
@game_mode = gets.chomp.to_i

if @game_mode == 1
  puts "\nPlease enter the name for Player 1"
  @name1 = gets.chomp
  puts "\nPlease enter the name for Player 2"
  @name2 = gets.chomp

  player_1 = TicTacToe::Player.new({name: @name1, weapon: "X", })
  player_2 = TicTacToe::Player.new({name: @name2, weapon: "0", })
  players = [player_1, player_2]

  TicTacToe::Game.new(players).play
end

# Enter names if human players
