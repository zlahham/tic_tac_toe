require_relative '../cli/cli'
require_relative 'player'

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
      formatted_grid(board)
      puts 'Please use the numbers 1-9'
      next_move = gets.chomp

      return MAPPING[next_move] if MAPPING[next_move]
      CLI.clear
      puts 'You choosen an invalid move'
      next_valid_move?(board)
    end
  end
end
