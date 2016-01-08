module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board=Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def change_players
      @current_player, @other_player = @other_player, @current_player
    end
  end
end
