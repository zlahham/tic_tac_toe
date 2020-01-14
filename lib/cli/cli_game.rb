# frozen_string_literal: true

require_relative '../players/human'
require_relative '../extensions'

module TicTacToe
  class CLIGame
    def initialize(game_modes)
      CLI.clear
      puts ''.center(CLI.term_width).yellow.on_blue
      puts "Welcome to ZL's edition of Tic Tac Toe".center(CLI.term_width).yellow.on_blue
      puts ''.center(CLI.term_width).yellow.on_blue
      @game_modes = game_modes
    end

    def run
      encore = true
      while encore == true
        game_mode = ask_valid_game_mode
        game = game_mode.create_game
        game.play
        game_over_message(game)
        game.other_player.formatted_grid(game.board)
        encore = play_again?
      end
    end

    def game_over_message(game)
      puts "\n#{game.other_player.name} won! Woohoooo!!!\n".red.back_light_blue if game.board.game_over == :winner
      puts "\nThe game ended in a tie".yellow if game.board.game_over == :draw
    end

    def ask_valid_game_mode
      puts "\n\nPlease choose from one of the following game modes:"
      @game_modes.each_with_index do |game_mode, i|
        puts "#{i + 1}. #{game_mode.name}"
      end
      i = gets.chomp.to_i
      @game_modes[i - 1] || ask_valid_game_mode
    end

    def play_again?
      puts "\nWould you like to play again?"
      puts '[Y/n]'.yellow
      ask_to_play_again = gets.chomp.downcase
      ask_to_play_again == 'n' || ask_to_play_again == 'no' ? false : true
    end
  end
end
