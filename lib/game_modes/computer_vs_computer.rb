require_relative '../players/computer'
require_relative '../game'

module TicTacToe
  module GameModes

    class ComputerVsComputer
      def name
        'Computer VS Computer'
      end

      def create_game
        player_1 = Computer.new(name: 'Computer 1', weapon: 'X')
        player_2 = Computer.new(name: 'Computer 2', weapon: 'O')
        p1, p2 = ask_who_goes_first(player_1, player_2)
        Game.new(p1, p2)
      end

      def ask_who_goes_first(player_1, player_2)
        puts "\n\nWho would you like to go first? #{'Player 1'.blue}: #{player_1.name.blue} or #{'Player 2'.red}: #{player_2.name.red}"
        puts "Please make a choice using #{'1'.underline} or #{'2'.underline}".green
        choice = gets.chomp.to_i
        if choice == 1
          [player_1, player_2]
        elsif choice == 2
          [player_2, player_1]
        end
      end
    end
  end
end
