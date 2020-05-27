require_relative './board'
require_relative './player'

class Game 
    def initialize  first_player_details, second_player_details
        first_player_details = first_player_details.split(": ")
        second_player_details = second_player_details.split (": ")
        @on = true
        
        @first_player =  Player.new(first_player_details[0], first_player_details[1])
        @second_player = Player.new(second_player_details[0], second_player_details[1])
        @winner = nil
        @win = false
        @draw = false
        playing
    end

    def playing
        current_player = pick_first_player(@first_player, @second_player) 
        grid = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]
        board = Board.new(grid)

        while !@win and !@draw
            puts "Current state"
            board.show
            puts "Let " + current_player.get_name + " make a move(choose a number in the range 1...9)"
            move = current_player.move
            valid_move = board.set_posn(move, current_player.get_mark)
            
            
            while !valid_move
                puts "Let " + current_player.get_name + " make a valid move"
                puts "The available moves are: " + board.get_available_moves.to_s
                move = current_player.move
                valid_move = board.set_posn(move, current_player.get_mark)
            end

            board.show
            current_player.set_played(true)
            current_player = switch_players(@first_player, @second_player)
            win = check_if_winner(board)

            if !win.nil?
                winner = nil
                for player in [@first_player, @second_player]
                    if player.get_mark == win
                        winner = player
                    end
                end

                @win = true
                @winner = winner
                @winner.show
                return
            end
            if check_if_draw(board) 
                @draw = true
                return
            end
        end
    end

    def get_winner 
        return "winner: " + @winner.get_name if @win == true
        return "draw" if @draw == true
    end

    def pick_first_player first_player, second_player
        choice = rand(101)
        if choice <= 50
            return first_player
        else
            return second_player
        end
    end
    
    def switch_players first_player, second_player
        if first_player.get_played
            first_player.set_played(false)
            return second_player
        end
        second_player.set_played(false)
        return first_player
    end

    def check_if_winner board
        board.check_winner
    end

    def check_if_draw board
        board.check_draw
    end
    
end