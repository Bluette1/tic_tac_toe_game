class Board
 
def get_posn(move)
  map = {
    "1" => [0, 0],
    "2" => [0, 1],
    "3" => [0, 2],
    "4" => [1, 0],
    "5" => [1, 1],
    "6" => [1, 2],
    "7" => [2, 0],
    "8" => [2, 1],
    "9" => [2, 2]
  }
  map[move]
end
    def initialize grid
        @grid = grid
    end

    def show
        puts '__' + '__' + '__'
        puts '|' + @grid[0][0] + '|' + @grid[0][1] + '|' + @grid[0][2] + '|' 
        puts '__' + '__' + '__'
        puts '|' + @grid[1][0] + '|' + @grid[1][1] + '|' + @grid[1][2] + '|'
        puts '__' + '__' + '__'
        puts '|' + @grid[2][0] + '|' + @grid[2][1] + '|' + @grid[2][2] + '|'
        puts '__' + '__' + '__'

    end

    def set_posn num, mark
        if valid_posn(num.to_s)
            posn = get_posn(num.to_s)
            @grid[posn[0]][posn[1]] = mark
            
            return true

        else
            return false
        end
    end

    def valid_posn num
        posn = get_posn(num)
        if @grid[posn[0]][posn[1]] == 'x' or  @grid[posn[0]][posn[1]] == 'o'
            return false
        else
            return true
        end

    end

    def get_available_moves
        available_moves = []
        for i in 1..9
            if valid_posn(i.to_s)
                available_moves << i
            end
        end
        available_moves
    end

    def check_draw 
        "There was a draw"
        return false unless get_available_moves.empty?
        return true
    end

    def check_winner 
        if !compare_row_elements.nil?
            return compare_row_elements
        end

        if !compare_column_elements.nil?
            return compare_column_elements
        end

        if !compare_diagonal_elements.nil?
            return compare_diagonal_elements
        end
    end

    def all_equal?(row)
       row.each_cons(2).all? { |x, y| x == y }
    end

    def compare_row_elements
        @grid.each { |row| return row.first if all_equal?(row) }
        return nil
    end

    def compare_column_elements
        @grid.transpose.each { |row| return row.first if all_equal?(row) }
        return nil
    end

    def compare_diagonal_elements
        diagonal_rows = [
            [@grid[0][0], @grid[1][1], @grid[2][2]], 
            [@grid[0][2], @grid[1][1], @grid[2][0]]
        ]    
        diagonal_rows.each { |row| return row.first if all_equal?(row) }
        return nil
    end

end