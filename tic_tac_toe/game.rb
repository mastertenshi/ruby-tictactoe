module TicTacToe
  class Game
    def initialize
      @player1 = Player.new('Player1'.red, 'X')
      @player2 = Player.new('Player2'.blue, 'O')
      @board = Board.new
      @taken_positions = []
    end

    def play
      player = @player1

      (1..9).each do |turns_count|
        position = prompt_position(player)

        @board.set_cell(position, player.sign)
        @taken_positions.push(position)

        game_win(player) if turns_count > 4 && win?(position, player.sign)

        player = (player == @player1) ? @player2 : @player1
      end

      game_tie
    end

    private

    def game_tie
      @board.draw
      puts "It's a tie!"
      play_again
    end

    def game_win(player)
      @board.draw
      puts "Congratz #{player.name} wins!!!"
      play_again
    end

    def play_again
      print "\nWanna play again? (y/n): "
      input = gets.chomp

      initialize and play if %W[y yes #{''}].include?(input.downcase)
      exit
    end

    def exit?(input)
      exit if %w[exit quit].include?(input.downcase)
    end

    def prompt_position(player = Player.new)
      @board.draw
      Display.player_turn(player)

      loop do
        input = gets.chomp
        exit?(input)

        position = input.to_i
        return position if position_valid?(position)
      end
    end

    def position_valid?(position)
      if position.between?(1, 9)
        return true unless @taken_positions.include?(position)

        Display.position_taken
      else
        Display.invalid_number
      end

      false
    end

    def win?(position, sign)
      return true if
        @board.get_column(position).all?(sign) ||
        @board.get_row(position).all?(sign) ||

        if position.odd?
          @board.diagonal('ltr').all?(sign) ||
          @board.diagonal('rtl').all?(sign)
        end

      false
    end
  end
end
