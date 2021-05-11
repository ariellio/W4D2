class Piece
    attr_writer :pos
    attr_reader :color 

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        pos == nil
    end

    # def symbol
    #     symbol
    # end


end
