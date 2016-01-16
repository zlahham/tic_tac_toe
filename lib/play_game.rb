require_relative './tic_tac_toe.rb'
require 'colorize'
require 'curses'
include Curses

Curses.init_screen
@term_width = Curses.cols
Curses.close_screen

Gem.win_platform? ? (system 'cls') : (system 'clear')
puts ''.center(@term_width).yellow.on_blue
puts "Welcome to ZL's edition of Tic Tac Toe".center(@term_width).yellow.on_blue
puts ''.center(@term_width).yellow.on_blue
puts "\nPlease choose a game mode:\n1: Human vs Human\n2: Human vs Computer\n3: Computer vs Computer\n".red
game_mode = gets.chomp.to_i

def lets_play_ttt(game_mode)
  case game_mode
  when 1 then game_mode_1
  when 2 then game_mode_2
  when 3 then game_mode_3
  else
    puts "\nPlease choose a game mode:\n1: Human vs Human\n2: Human vs Computer\n3: Computer vs Computer\n"
    game_mode = gets.chomp.to_i
    lets_play_ttt(game_mode)
  end
end

def game_mode_1
  play_again = false
  while play_again != 'n' || play_again != 'no'
    puts "\nPlease enter the name for #{'Player 1'.blue}"
    @name1 = gets.chomp
    puts "\nPlease enter the name for #{'Player 2'.red}"
    @name2 = gets.chomp

    player_1 = TicTacToe::Player.new(name: @name1, weapon: 'X')
    player_2 = TicTacToe::Player.new(name: @name2, weapon: 'O')
    players = [player_1, player_2]
    initiate_game(players)
  end
end

def game_mode_2
  play_again = false
  while play_again != 'n' || play_again != 'no'
    puts "\nPlease enter the name for #{'Player 1'.blue}"
    @name1 = gets.chomp

    player_1 = TicTacToe::Player.new(name: @name1, weapon: 'X')
    computer = TicTacToe::Computer.new(name: 'Computer', weapon: 'O')
    players = [player_1, computer]
    initiate_game(players)
  end
end

def game_mode_3
  play_again = false
  until play_again == 'n' || play_again == 'no'
    computer_1 = TicTacToe::Computer.new(name: 'Computer 1', weapon: 'X')
    computer_2 = TicTacToe::Computer.new(name: 'Computer 2', weapon: '0')
    players = [computer_1, computer_2]
    initiate_game(players)
  end
end

def initiate_game(players)
  game = TicTacToe::Game.new(players)
  game.which_player_goes_first
  game.play
  puts "\nWould you like to play again?"
  puts '[Y/n]'.yellow
  _play_again = gets.chomp.downcase
end

lets_play_ttt(game_mode)
