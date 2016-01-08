module TicTacToe
  class Player
    attr_reader :name, :weapon

    def initialize(options)
      @name   = options.fetch(:name)
      @weapon = options.fetch(:weapon)
    end

  end
end
