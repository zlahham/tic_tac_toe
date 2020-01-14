# frozen_string_literal: true

module TicTacToe
  class Player
    attr_reader :name, :weapon

    def initialize(options)
      @name   = options.fetch(:name)
      @weapon = options.fetch(:weapon)
    end

    def formatted_grid(board)
      board.grid.each do |row|
        print row.map { |cell| cell.empty? ? '_'.light_yellow : color_x_o(cell) }.join('   ')
        print "\n\n"
      end
    end

    def color_x_o(input)
      input == 'X' ? input.blue : input.red
    end
  end
end
