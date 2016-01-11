require_relative "./tic_tac_toe.rb"
require "colorize"
require "curses"
include Curses


Curses.init_screen
@term_width = Curses.cols
Curses.close_screen

# WELCOME
Gem.win_platform? ? (system "cls") : (system "clear")
puts "".center(@term_width).colorize(:yellow).on_blue
puts "Welcome to ZL's edition of Tic Tac Toe".center(@term_width).colorize(:yellow).on_blue
puts "".center(@term_width).colorize(:yellow).on_blue

# Which Game mode?
puts "\nPlease choose a game mode:\n1: Human vs Human\n2: Human vs Computer\n3: Computer vs Computer\n"
@game_mode = gets.chomp.to_i

def lets_play_ttt(game_mode)
  if @game_mode == 1 # Human vs Human
    while true
      puts "\nPlease enter the name for #{"Player 1".colorize(:blue)}"
      @name1 = gets.chomp
      puts "\nPlease enter the name for #{"Player 2".colorize(:red)}"
      @name2 = gets.chomp

      player_1 = TicTacToe::Player.new({name: @name1, weapon: "X", })
      player_2 = TicTacToe::Player.new({name: @name2, weapon: "O", })
      players = [player_1, player_2]

      TicTacToe::Game.new(players).play
      puts "\nWould you like to play again?"
      puts "[Y/n]".colorize(:yellow)
      play_again = gets.chomp.downcase
      break if play_again == "n" || play_again == "no"
    end
  elsif @game_mode == 2 # Human vs Computer
    while true
      puts "\nPlease enter the name for #{"Player 1".colorize(:blue)}"
      @name1 = gets.chomp

      player_1 = TicTacToe::Player.new({name: @name1, weapon: "X", })
      computer = TicTacToe::Computer.new({name: "Computer", weapon: "0", })
      players = [player_1, computer]

      TicTacToe::Game.new(players).play
      puts "\nWould you like to play again?"
      puts "[Y/n]".colorize(:yellow)
      play_again = gets.chomp.downcase
      break if play_again == "n" || play_again == "no"
    end
  elsif @game_mode == 3 # Computer vs Computer
    while true

      computer_1 = TicTacToe::Computer.new({name: "Computer 1", weapon: "X", })
      computer_2 = TicTacToe::Computer.new({name: "Computer 2", weapon: "0", })
      players = [computer_1, computer_2]

      TicTacToe::Game.new(players).play
      puts "\nWould you like to play again?"
      puts "[Y/n]".colorize(:yellow)
      play_again = gets.chomp.downcase
      break if play_again == "n" || play_again == "no"
    end

  else
    puts "\nPlease choose a game mode:\n1: Human vs Human\n2: Human vs Computer\n3: Computer vs Computer\n"
    @game_mode = gets.chomp.to_i
    lets_play_ttt(@game_mode)
  end
end


lets_play_ttt(@game_mode)
