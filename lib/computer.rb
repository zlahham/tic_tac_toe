module TicTacToe
  class Computer
    attr_reader :name, :weapon

    def initialize(options)
      @name   = options.fetch(:name)
      @weapon = options.fetch(:weapon)
    end

    def loading_animation
      str = "\r#{name} is thinking"
      10.times do
        print str += ' 🤖'
        sleep(0.1)
      end
    end
  end
end
