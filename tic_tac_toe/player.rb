module TicTacToe
  class Player
    attr_accessor :position
    attr_reader :name, :sign

    def initialize(name = 'P1', sign = 'N')
      @name = name
      @sign = sign
    end
  end
end
