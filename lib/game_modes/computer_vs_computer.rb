# typed: true
# frozen_string_literal: true

require_relative '../players/computer'
require_relative '../game'

module TicTacToe
  module GameModes
    class ComputerVsComputer
      def name
        'Computer VS Computer'
      end

      def create_game
        player_one = Computer.new(name: 'Computer 1', weapon: 'X')
        player_two = Computer.new(name: 'Computer 2', weapon: 'O')
        p1, p2 = ask_who_goes_first(player_one, player_two)
        Game.new(p1, p2)
      end

      def ask_who_goes_first(player_one, player_two)
        puts "\n\nWho would you like to go first? #{'Player 1'.blue}: #{player_one.name.blue} or #{'Player 2'.red}: #{player_two.name.red}"
        puts "Please make a choice using #{'1'.underline} or #{'2'.underline}".green
        choice = gets.chomp.to_i
        choice == 1 ? [player_one, player_two] : [player_two, player_one]
      end
    end
  end
end
