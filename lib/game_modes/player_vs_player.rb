# typed: true
# frozen_string_literal: true

require_relative '../players/human'
require_relative '../game'

module TicTacToe
  module GameModes
    class PlayerVsPlayer
      def name
        'Player VS Player'
      end

      def create_game
        player_one = Human.new(name: ask_name_for('Player 1'), weapon: 'X')
        player_two = Human.new(name: ask_name_for('Player 2'), weapon: 'O')
        p1, p2 = ask_who_goes_first(player_one, player_two)
        Game.new(p1, p2)
      end

      def ask_who_goes_first(player_one, player_two)
        puts "\n\nWho would you like to go first? #{'Player 1'.blue}: #{player_one.name.blue} or #{'Player 2'.red}: #{player_two.name.red}"
        puts "Please make a choice using #{'1'.underline} or #{'2'.underline}".green
        choice = gets.chomp.to_i
        choice == 1 ? [player_one, player_two] : [player_two, player_one]
      end

      def ask_name_for(player)
        puts "\nChoose name for #{player}"
        gets.chomp
      end
    end
  end
end
