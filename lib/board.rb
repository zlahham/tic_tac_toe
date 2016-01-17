module TicTacToe
  class Board
    attr_reader :grid

    def initialize(options = {})
      @grid = options.fetch(:grid, grid_shape)
    end

    def find_cell(x, y)
      grid[y][x]
    end

    def find_cell_value(x, y)
      grid[y][x].value
    end

    def set_cell(x, y, input)
      find_cell(x, y).value = input
    end

    def game_over
      return :winner if winner?
      return :draw   if draw?
      false
    end

    def show_user_possibilities
      "THESE ARE THE POSSIBILITIES:\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n".yellow
    end

    def formatted_grid
      grid.each do |row|
        print row.map { |cell| cell.value.empty? ? '_'.light_yellow : color_x_o(cell.value) }.join('   ')
        print "\n\n"
      end
    end

    private

    def grid_shape
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def draw?
      grid.flatten.map(&:value).none_empty?
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map(&:value)
    end

    def winning_positions
      grid + grid.transpose + diagonals
    end

    def diagonals
      [[find_cell(0, 0), find_cell(1, 1), find_cell(2, 2)],
       [find_cell(0, 2), find_cell(1, 1), find_cell(2, 0)]]
    end

    def color_x_o(input)
      input == 'X' ? input.blue : input.red
    end
  end
end
