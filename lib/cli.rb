require_relative './tic_tac_toe.rb'
require 'colorize'
require 'curses'

module TicTacToe
  class CLIGame
    def start
      CLI.clear

      puts ''.center(CLI.term_width).yellow.on_blue
      puts "Welcome to ZL's edition of Tic Tac Toe".center(@term_width).yellow.on_blue
      puts ''.center(CLI.term_width).yellow.on_blue

      lets_play_ttt(choose_game_mode)
    end

    def choose_game_mode
      puts "\nPlease choose a game mode:\n1: Human vs Human\n2: Human vs Computer\n3: Computer vs Computer\n".red
      gets.chomp.to_i
    end

    def lets_play_ttt(game_mode)
      case game_mode
      when 1 then play(game_mode_1)
      when 2 then play(game_mode_2)
      when 3 then play(game_mode_3)
      else
        lets_play_ttt(choose_game_mode)
      end
    end

    def play(players)
      play_again = true
      while play_again == true
        initiate_game(players)
        play_again = finalise_game
      end
    end

    def game_mode_1
      human_vs_human_names
      player_1 = TicTacToe::Human.new(name: @name1, weapon: 'X')
      player_2 = TicTacToe::Human.new(name: @name2, weapon: 'O')
      [player_1, player_2]
    end

    def game_mode_2
      human_vs_computer_names
      player_1 = TicTacToe::Human.new(name: @name1, weapon: 'X')
      computer = TicTacToe::Computer.new(name: 'Computer', weapon: 'O')
      [player_1, computer]
    end

    def game_mode_3
      computer_1 = TicTacToe::Computer.new(name: 'Computer 1', weapon: 'X')
      computer_2 = TicTacToe::Computer.new(name: 'Computer 2', weapon: '0')
      [computer_1, computer_2]
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
  end

  module CLI
    def self.term_width
      Curses.init_screen
      m_term_width = Curses.cols
      Curses.close_screen
      m_term_width
    end

    def clear
      Gem.win_platform? ? (system 'cls') : (system 'clear')
    end
  end
end
