module TicTacToe
  class Game

    attr_reader :players, :board, :current_player, :other_player

    MAPPING = {
      "1" => [0, 0], "2" => [1, 0], "3" => [2, 0],
      "4" => [0, 1], "5" => [1, 1], "6" => [2, 1],
      "7" => [0, 2], "8" => [1, 2], "9" => [2, 2]
    }

    def initialize(players, board=Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players
    end

    def change_players
      @current_player, @other_player = @other_player, @current_player
    end

    def ask_for_player_move
      messages(0)
    end

    def get_move(human_move = gets.chomp)
      human_move_to_coord(integer_checker(human_move))
    end

    def game_over_message
      return messages(1) if board.game_over == :winner
      return messages(2) if board.game_over == :draw
    end

    def play
      which_player_goes_first
      puts messages(3)
      puts board.show_user_possibilities
      while true
        board.formatted_grid
        puts
        puts ask_for_player_move
        a, b = get_move
        x, y = check_cell_occupied(a, b)
        board.set_cell(x, y, current_player.weapon)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          Gem.win_platform? ? (system "cls") : (system "clear")
          change_players
        end
      end
    end

    private

    def human_move_to_coord(human_move)
      MAPPING[human_move]
    end

    def integer_checker(input)
      while true
        break if (1..9).include?(input.to_i)
        puts messages(4)
        input = gets.chomp
      end
      input
    end

    def check_cell_occupied(x, y)
      while true
        break if board.coords_cell(x, y).value.empty?
        puts messages(5)
        x, y = human_move_to_coord(gets.chomp)
      end
      [x, y]
    end

    def which_player_goes_first
      puts messages(6)
      puts messages(7)
      choice = gets.chomp.to_i
      @current_player, @other_player = @players[1], @players[0] if choice == 2
    end

    def messages(num)
      msgs = [
        "#{current_player.name}: Enter a number between 1 and 9 to make your move",
        "\n#{current_player.name} won!",
        "\nThe game ended in a tie",
        "\n#{current_player.name} has been selected as the first player",
        "Please use the numbers 1-9",
        "\n This cell is already occupied\n",
        "\n\nWho would you like to go first? #{"Player 1".colorize(:blue)}: #{@players[0].name.colorize(:blue)} or #{"Player 2".colorize(:red)}: #{@players[1].name.colorize(:red)}",
        "Please make a choice using #{"1".underline} or #{"2".underline}".colorize(:green)
      ]
      msgs[num]
    end
  end
end
