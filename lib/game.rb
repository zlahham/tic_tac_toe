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
      human_move_to_coord(human_move)
    end

    private

    def human_move_to_coord(human_move)
      MAPPING[human_move]
    end
  end
end
