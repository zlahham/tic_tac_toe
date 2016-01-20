require_relative 'human'

module TicTacToe
  class CLIGame
    GAME_MODES = [:player_vs_player, :player_vs_computer, :computer_vs_computer].freeze

    def run
      game_mode = ask_valid_game_mode
      send(game_mode)
    end

    def ask_valid_game_mode
      puts 'Please choose a game mode 1,2,3'
      GAME_MODES[gets.chomp.to_i - 1]
    end

    def ask_name_for(player)
      puts "Choose name for #{player}"
      gets.chomp
    end

    def player_vs_player
      player_1 = Human.new(name: ask_name_for('Player 1'), weapon: 'X')
      player_2 = Human.new(name: ask_name_for('Player 2'), weapon: 'O')
      game = Game.new(player_1, player_2)
      game.play(0)
    end

    def player_vs_computer
      player_1 = Human.new(name: ask_name_for('Player 1'), weapon: 'X')
      player_2 = Computer.new(name: 'Computer', weapon: 'O')
      game = Game.new(player_1, player_2)
      game.play(0)
    end

    def computer_vs_computer
      player_1 = Computer.new(name: 'Computer 1', weapon: 'X')
      player_2 = Computer.new(name: 'Computer 2', weapon: 'O')
      game = Game.new(player_1, player_2)
      game.play(0)
    end
  end
end
