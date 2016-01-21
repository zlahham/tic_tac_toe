require_relative '../players/human'
require_relative '../players/computer'
require_relative '../game'

module TicTacToe
  module GameModes
    class PlayerVsComputer
      def name
        'Player VS Computer'
      end

      def create_game
        player_1 = Human.new(name: ask_name_for('Player 1'), weapon: 'X')
        player_2 = Computer.new(name: 'Computer', weapon: 'O')
        p1, p2 = ask_who_goes_first(player_1, player_2)
        Game.new(p1, p2)
      end

      def ask_who_goes_first(player_1, player_2)
        puts "\n\nWho would you like to go first? #{'Player 1'.blue}: #{player_1.name.blue} or #{'Player 2'.red}: #{player_2.name.red}"
        puts "Please make a choice using #{'1'.underline} or #{'2'.underline}".green
        choice = gets.chomp.to_i
        choice == 1 ? [player_1, player_2] : [player_2, player_1]
      end

      def ask_name_for(player)
        puts "\nChoose name for #{player}"
        gets.chomp
      end
    end
  end
end
