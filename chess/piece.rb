class Piece
    attr_writer :pos
    attr_reader :color 

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        false
    end

    # def symbol
    #     symbol
    # end


end
