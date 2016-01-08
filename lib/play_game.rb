require_relative './tic_tac_toe.rb'

puts "Welcome to ZL's eddition of Tic Tac Toe"
# Which Game mode?
# Enter names if human players
player_1 = TicTacToe::Player.new({name: "Player 1", weapon: "X", })
player_2 = TicTacToe::Player.new({name: "Player 2", weapon: "0", })
players = [player_1, player_2]
TicTacToe::Game.new(players).play
