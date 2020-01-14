# typed: true
# frozen_string_literal: true

require_relative 'board'

module TicTacToe
  class Game
    attr_reader :board

    def initialize(player_one, player_two, board = Board.new)
      @players = [player_one, player_two]
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
      @current_player_id = @current_player_id.zero? ? 1 : 0
    end

    def ask_a_valid_move(player)
      move = player.next_move?(@board)
      if valid_move?(move)
        move
      else
        ask_a_valid_move(player)
      end
    end

    def valid_move?(move)
      x, y = move
      numeric_check(x, y)
      range_check(x, y)
      occupied_check(x, y)
    end

    def numeric_check(x_coord, y_coord)
      return false unless x_coord.is_a?(Numeric) && y_coord.is_a?(Numeric)
    end

    def range_check(x_coord, y_coord)
      return false if x_coord.negative? || y_coord.negative? || x_coord > 2 || y_coord > 2
    end

    def occupied_check(x_coord, y_coord)
      @board.cell_empty?(x_coord, y_coord)
    end
  end
end
