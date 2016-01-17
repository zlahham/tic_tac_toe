module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    MAPPING = {
      '1' => [0, 0], '2' => [1, 0], '3' => [2, 0],
      '4' => [0, 1], '5' => [1, 1], '6' => [2, 1],
      '7' => [0, 2], '8' => [1, 2], '9' => [2, 2]
    }.freeze

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players
    end

    def change_players
      @current_player, @other_player = @other_player, @current_player
    end

    def ask_for_player_move
      messages(:a)
    end

    def final_move # TEST THIS
      if current_player.is_a? Computer
        a, b = computer_move
        # current_player.loading_animation
      else
        a, b = human_move
      end
      [a, b]
    end

    def human_move(move = gets.chomp)
      move_1 = integer_checker(move)
      move_2 = move_to_coord(move_1)
      check_cell_occupied(move_2)
    end

    def computer_move # TEST THIS
      state
      move = Minimax.next_best_step(state)
      move_to_coord((move + 1).to_s)
    end

    def state # TEST THIS
      state = (0..2).flat_map do |r|
        (0..2).map do |c|
          case _val = board.find_cell_value(c, r)
          when current_player.weapon then 1
          when other_player.weapon then -1
          else 0
          end
        end
      end
      state
    end

    def game_over_message
      return messages(:b) if board.game_over == :winner
      return messages(:c) if board.game_over == :draw
    end

    def play # TEST THIS
      puts messages(:d)
      puts board.show_user_possibilities
      keep_playing_until_over
      puts game_over_message
      board.formatted_grid
    end

    def which_player_goes_first
      puts messages(:g)
      puts messages(:h)
      choice = gets.chomp.to_i
      change_players if choice == 2
    end

    private

    def keep_playing_until_over
      until board.game_over
        board.formatted_grid
        puts ask_for_player_move
        a, b = final_move
        board.set_cell(a, b, current_player.weapon)
        Gem.win_platform? ? (system 'cls') : (system 'clear')
        change_players
      end
    end

    def move_to_coord(move)
      MAPPING[move]
    end

    def integer_checker(input)
      until (1..9).cover?(input.to_i)
        puts messages(:e)
        input = gets.chomp
      end
      input
    end

    def check_cell_occupied(cell_coordinates)
      x, y = cell_coordinates
      until board.find_cell(x, y).value.empty?
        puts messages(:f)
        x, y = move_to_coord(gets.chomp)
      end
      [x, y]
    end

    def messages(key)
      msgs = {
        a: "#{current_player.weapon == 'X' ? current_player.name.blue : current_player.name.red}: Enter a number between 1 and 9 to make your move",
        b: "\n#{other_player.name} won! Woohoooo!!!\n".red.back_light_blue,
        c: "\nThe game ended in a tie".yellow,
        d: "\n#{current_player.name} has been selected as the first player",
        e: 'Please use the numbers 1-9',
        f: "\n This cell is already occupied\n",
        g: "\n\nWho would you like to go first? #{'Player 1'.blue}: #{@players.first.name.blue} or #{'Player 2'.red}: #{@players.last.name.red}",
        h: "Please make a choice using #{'1'.underline} or #{'2'.underline}".green }
      msgs[key]
    end
  end
end
