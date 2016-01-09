module TicTacToe
  class Game

    attr_reader :players, :board, :current_player, :other_player

    MAPPING = {
      "1" => [0, 0], "2" => [1, 0], "3" => [2, 0],
      "4" => [0, 1], "5" => [1, 1], "6" => [2, 1],
      "7" => [0, 2], "8" => [1, 2], "9" => [2, 2]
    }

    def initialize(players, board=Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def change_players
      @current_player, @other_player = @other_player, @current_player
    end

    def ask_for_player_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move"
    end

    def get_move(human_move = gets.chomp)
      # int_input = integer_checker(human_move)
      human_move_to_coord(integer_checker(human_move))
    end

    def game_over_message
      return "\n#{current_player.name} won!" if board.game_over == :winner
      return "\nThe game ended in a tie" if board.game_over == :draw
    end

    def play
      puts "\n#{current_player.name} has randomly been selected as the first player"
      puts
      while true
        board.formatted_grid
        puts ""
        puts ask_for_player_move
        x, y = get_move
        board.set_cell(x, y, current_player.weapon)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          play
        else
          change_players
        end
      end
    end

    private

    def human_move_to_coord(human_move)
      MAPPING[human_move]
    end

    def integer_checker(input)
      while true
        break if (1..9).include?(input.to_i)
        puts 'Please use the numbers 1-9'
        input = gets.chomp
      end
      input
    end
  end
end
