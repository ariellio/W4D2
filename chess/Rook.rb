require_relative 'piece.rb'
class Rook < Piece
    attr_reader :pos
    include Slideable

    def initialize(symbol, color, board, pos)
        @symbol = symbol
        super(color, board, pos)
    end

    # private

    def move_dirs
       print HORIZONTAL_DIRS 
    end

end