module TicTacToe
  class Computer < Player
    private

    def loading_animation
      str = "\r#{name} is thinking"
      10.times do
        print str += ' 🤖'
        sleep(0.1)
      end
    end
  end
end
