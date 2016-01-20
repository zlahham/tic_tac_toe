module TicTacToe
  class Computer < Player
    def next_move?(board)
      make_coord(Minimax.next_best_step(board_to_minimax(board)))
    end

    def board_to_minimax(board)
      (0..2).flat_map do |r|
        (0..2).map do |c|
          case _val = board.find_cell(c, r)
          when weapon then 1
          when '' then 0
          else -1
          end
        end
      end
    end

    def make_coord(val)
      [val % 3, val / 3]
    end
  end
end
