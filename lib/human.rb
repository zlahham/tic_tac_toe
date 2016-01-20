require_relative 'cli'

module TicTacToe
  class Human < Player
    MAPPING = {
      '1' => [0, 0], '2' => [1, 0], '3' => [2, 0],
      '4' => [0, 1], '5' => [1, 1], '6' => [2, 1],
      '7' => [0, 2], '8' => [1, 2], '9' => [2, 2]
    }.freeze

    def next_move?(board)
      CLI.clear
      next_valid_move?(board)
    end

    def next_valid_move?(board)
      puts formatted_grid(board)
      next_move = gets.chomp

      return MAPPING[next_move] if MAPPING[next_move]
      CLI.clear
      puts 'You choosen an invalid move'
      next_valid_move?(board)
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
