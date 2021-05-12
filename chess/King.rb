require_relative 'piece.rb'
require_relative 'stepable.rb'
require_relative 'slideable.rb'

class King < Piece
    include Stepable
    include Slideable

    def symbol
        '♚'.colorize(color)
    end

    protected 
    def move_diffs
        valid = []
        directions = horizontal_and_vertical_dirs + diagonal_dirs
        directions.each do |ele|
            valid << [pos[0] + ele[0], pos[1] + ele[1]]
        end
        valid 
    end

end