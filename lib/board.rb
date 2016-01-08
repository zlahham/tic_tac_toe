module TicTacToe
  class Board
    attr_reader :grid

    def initialize(options = {})
      @grid = options.fetch(:grid, grid_shape)
    end

    def coords_cell(x,y)
      grid[y][x]
    end

    def set_cell(x,y,value)
      x_o_checker(value)
      coords_cell(x,y).replace(value)
    end

    def game_over
      return :winner if winner?
      return :draw   if draw?
      false
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

    def x_o_checker(input)
      raise 'Please use X or O' unless input.upcase == 'X' || input.upcase == 'O'
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def winner?
    end
  end

end
