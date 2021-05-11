require_relative 'piece'
require_relative 'nullpiece'

class Board

    attr_accessor :grid
    
    def self.fill_grid
        black_pieces = Array.new(2) {Array.new(8) {:x} }
        mid_grid = Array.new(4) {Array.new(8) {nil} }
        white_pieces = Array.new(2) {Array.new(8) {:x} }
        black_pieces + mid_grid + white_pieces
    end

    def initialize
        @grid = Board.fill_grid
        @null_piece = NullPiece.new
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        grid[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        range = (0..7).to_a
        raise 'There is no piece here.' if self[start_pos] == nil || !range.include?(start_pos[0]) || !range.include?(start_pos[1])
        raise 'Piece cannot move there.' if !range.include?(end_pos[0]) || !range.include?(end_pos[1])
        piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece
    end

end

# chess = Board.new
# p chess
# chess.move_piece([0,0], [4,4])
# p chess