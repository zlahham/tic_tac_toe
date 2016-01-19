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

def choose_game_mode
  puts "\nPlease choose a game mode:\n1: Human vs Human\n2: Human vs Computer\n3: Computer vs Computer\n".red
  gets.chomp.to_i
end

def lets_play_ttt(game_mode)
  case game_mode
  when 1 then game_mode_1
  when 2 then game_mode_2
  when 3 then game_mode_3
  else
    lets_play_ttt(choose_game_mode)
  end
end

def game_mode_1
  play_again = true
  while play_again == true
    human_vs_human_names
    player_1 = TicTacToe::Human.new(name: @name1, weapon: 'X')
    player_2 = TicTacToe::Human.new(name: @name2, weapon: 'O')
    players = [player_1, player_2]
    initiate_game(players)
    play_again = finalise_game
  end
end

def game_mode_2
  play_again = true
  while play_again == true
    human_vs_computer_names
    player_1 = TicTacToe::Human.new(name: @name1, weapon: 'X')
    computer = TicTacToe::Computer.new(name: 'Computer', weapon: 'O')
    players = [player_1, computer]
    initiate_game(players)
    play_again = finalise_game
  end
end

def game_mode_3
  play_again = true
  while play_again == true
    computer_1 = TicTacToe::Computer.new(name: 'Computer 1', weapon: 'X')
    computer_2 = TicTacToe::Computer.new(name: 'Computer 2', weapon: '0')
    players = [computer_1, computer_2]
    initiate_game(players)
    play_again = finalise_game
  end
end

def human_vs_human_names
  puts "\nPlease enter the name for #{'Player 1'.blue}"
  @name1 = gets.chomp
  puts "\nPlease enter the name for #{'Player 2'.red}"
  @name2 = gets.chomp
end

def human_vs_computer_names
  puts "\nPlease enter the name for #{'Player 1'.blue}"
  @name1 = gets.chomp
end

def initiate_game(players)
  game = TicTacToe::Game.new(players)
  game.which_player_goes_first
  game.play
end

def finalise_game
  puts "\nWould you like to play again?"
  puts '[Y/n]'.yellow
  ask_to_play_again = gets.chomp.downcase
  ask_to_play_again == 'n' || ask_to_play_again == 'no' ? false : true
end

lets_play_ttt(choose_game_mode)
