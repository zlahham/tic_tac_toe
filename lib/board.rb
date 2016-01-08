module TicTacToe
  class Board
    attr_reader :grid

    def initialize(options = {})
      @grid = options.fetch(:grid, grid_shape)
    end

    def coords_cell(x,y)
      grid[y][x]
    end

    private

    def grid_shape
      Array.new(3) { Array.new(3) { Cell.new } }
      # board_layout = Array.new(3, Cell.new ).map{|row| Array.new(3, Cell.new)}
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
  end

end
