module TicTacToe
  module Minimax
    INITIAL_STATE = [0, 0, 0, 0, 0, 0, 0, 0, 0].freeze
    @@cache = {}

    def self.next_best_step(state)
      outcomes = free_positions(state).map do |i|
        [i, minimax(mark(state, 1, i), false)]
      end
      best_score = outcomes.max_by { |_i, score| score }[1]
      outcomes.select { |_i, score| score == best_score }.sample[0]
    end

    def self.hash(state, maximizing)
      state.map { |s| s + 1 }.join '' + (maximizing ? '1' : '0')
    end

    def self.finished(state)
      win?(state, 1) || win?(state, -1) || draw?(state)
    end

    def self.minimax(state, maximizing)
      @@cache[hash(state, maximizing)] ||= calculate_minimax(state, maximizing)
    end

    def self.calculate_minimax(state, maximizing)
      return 1 if win?(state, 1)
      return -1 if win?(state, -1)
      return 0 if draw?(state)

      if maximizing
        free_positions(state).map { |i| minimax mark(state, 1, i), false }.max
      else
        free_positions(state).map { |i| minimax mark(state, -1, i), true }.min
      end
    end

    def self.free_positions(state)
      state.each_with_index.select { |mark, _i| mark == 0 }.map { |_mark, i| i }
    end

    def self.mark(state, value, index)
      state.clone.tap { |s| s[index] = value }
    end

    def self.win?(state, val)
      [
        state[0..2].all? { |v| v == val },
        state[3..5].all? { |v| v == val },
        state[6..8].all? { |v| v == val },
        get_column(state, 0).all? { |v| v == val },
        get_column(state, 1).all? { |v| v == val },
        get_column(state, 2).all? { |v| v == val },
        [state[0], state[4], state[8]].all? { |v| v == val },
        [state[2], state[4], state[6]].all? { |v| v == val }
      ].any?
    end

    def self.draw?(state)
      !win?(state, -1) && !win?(state, 1) && !state.include?(0)
    end

    def self.get_column(state, col)
      (0..2).map { |r| state[r * 3 + col] }
    end

    # TESTS HERE
    def self.test(num)
      Array.new(num) { test_play(INITIAL_STATE) }.all? { |state| draw? state }
    end

    def self.test_play(state)
      if finished(state)
        state
      else
        next_move = next_best_step(state)
        next_state = mark(state, 1, next_move)
        test_play next_state.map { |x| x * - 1 }
      end
    end
  end
end
