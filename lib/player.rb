class Player
    def initialize name, mark
        @name = name
        @mark = mark
        @played = false
    end

    def show
        puts @name + "(" + @mark + ") is the WINNER!!!"
    end

    def move 
        choice =  gets.chomp
        valid = (1..9).include?(choice.to_i)
        while !valid
            puts "Enter a number in the range 1...9."
            choice =  gets.chomp
            valid = (1..9).include?(choice.to_i)
        end
        return choice
    end

    def get_name
        return @name
    end

    def get_mark 
        return @mark
    end

    def set_played flag

        @played = flag
  
      end
  
      def get_played 
          return @played
      end

end
