# frozen_string_literal: true

module TicTacToe
  class Board
    attr_reader :grid

    def initialize(options = {})
      @grid = options.fetch(:grid, grid_shape)
    end

    def find_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, input)
      grid[y][x] = input
    end

    def game_over
      return :winner if winner?
      return :draw   if draw?

      false
    end

    def cell_empty?(x, y)
      find_cell(x, y).empty?
    end

    private

    def grid_shape
      Array.new(3) { Array.new(3) { '' } }
    end

    def draw?
      grid.flatten.none_empty?
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position.all_empty?
        return true if winning_position.all_same?
      end
      false
    end

    def winning_positions
      grid + grid.transpose + diagonals
    end

    def diagonals
      [[find_cell(0, 0), find_cell(1, 1), find_cell(2, 2)],
       [find_cell(0, 2), find_cell(1, 1), find_cell(2, 0)]]
    end
  end
end
