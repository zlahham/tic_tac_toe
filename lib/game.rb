require_relative 'board'

module TicTacToe
  class Game
    attr_reader :board

    def initialize(player_1, player_2, board = Board.new)
      @players = player_1, player_2
      @board = board
      @current_player_id = 0
    end

    def play
      play_round until board.game_over
      return other_player if board.game_over == :winner
      :draw
    end

    def play_round
      x, y = ask_a_valid_move(current_player)
      board.set_cell(x, y, current_player.weapon)
      swap_players
    end

    def current_player
      @players[@current_player_id]
    end

    def other_player
      @players[1 - @current_player_id]
    end

    private

    def swap_players
      @current_player_id = @current_player_id == 0 ? 1 : 0
    end

    def ask_a_valid_move(player)
      move = player.next_move?(@board)
      if valid_move?(move) then move
      else ask_a_valid_move(player) end
    end

    def valid_move?(move)
      x, y = move
      numeric?(x, y)
      range?(x, y)
      occupied?(x, y)
    end

    def numeric?(x, y)
      return false unless x.is_a?(Numeric) && y.is_a?(Numeric)
    end

    def range?(x, y)
      return false if x < 0 || y < 0 || x > 2 || y > 2
    end

    def occupied?(x, y)
      @board.cell_empty?(x, y)
    end
  end
end
