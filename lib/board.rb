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

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join("\t")
      end
    end

    private

    def grid_shape
      Array.new(3) { Array.new(3) { Cell.new } }

      # board_layout = Array.new(3, Cell.new ).map{|row| Array.new(3, Cell.new)}
      # board_layout = Array.new(3) { Array.new(3) { Cell.new.value } }
      # row_label = ["0", "1", "2"]
      # column_label = ["A", "B", "C"]
      # print "\t"
      # print row_label.join("\t")
      # puts
      # board_layout.each_with_index do |row, i|
      #   print column_label[i]
      #   print "\t"
      #   print row.join("\t")
      #   puts
      # end
      # puts "\nIt is now your turn!\n"
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
      [
        [coords_cell(0, 0), coords_cell(1, 1), coords_cell(2, 2)],
        [coords_cell(0, 2), coords_cell(1, 1), coords_cell(2, 0)]
      ]
    end
  end
end
