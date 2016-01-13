module TicTacToe
  class Board
    attr_reader :grid

    def initialize(options = {})
      @grid = options.fetch(:grid, grid_shape)
    end

    def coords_cell(x,y)
      grid[y][x]
    end

    def set_cell(x,y,input)
      coords_cell(x, y).value = input
    end

    def game_over
      return :winner if winner?
      return :draw   if draw?
      false
    end

    def show_user_possibilities
      "THESE ARE THE POSSIBILITIES:\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n".colorize(:yellow)
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_".colorize(:light_yellow) : color_x_o(cell.value) }.join("\t")
      end
    end

    private

    def grid_shape
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    def winning_positions
      grid + grid.transpose + diagonals
    end

    def diagonals
      [ [coords_cell(0, 0), coords_cell(1, 1), coords_cell(2, 2)],
        [coords_cell(0, 2), coords_cell(1, 1), coords_cell(2, 0)] ]
    end

    def color_x_o(input)
      input == "X" ? input.colorize(:blue) : input.colorize(:red)
    end
  end
end
