module TicTacToe
  module Display
    def self.position_taken
      puts "#{'Error! '.red} Position already played."
      print 'Try another position [1-9]: '
    end

    def self.invalid_number
      print "#{'Error! '.red} Enter number between [1-9]: "
    end

    def self.player_turn(player)
      # Colorize X and O
      sign = (player.sign == 'X') ? player.sign.red : player.sign.blue

      puts "#{player.name}'s turn (#{sign})"
      print "\nEnter position number: "
    end

    def self.clear
      Gem.win_platform? ? (system 'cls') : (system 'clear')
    end

    def self.v_tab
      Gem.win_platform? ? (2.times do puts ''; end) : (puts "\v")
    end
  end
end
