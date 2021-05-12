require_relative 'piece'
require_relative 'nullpiece'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require_relative 'display'
require 'byebug'

class Board

    attr_accessor :grid
    
    def initialize
        @null_piece = NullPiece.instance
        @grid = fill_grid
    end

    def create_grid
        black_pieces = Array.new(2) {Array.new(8) {:b} }
        mid_grid = Array.new(4) {Array.new(8, @null_piece) }
        white_pieces = Array.new(2) {Array.new(8) {:w} }
        black_pieces + mid_grid + white_pieces
    end

    def fill_grid
        skele = create_grid
        black_first = [
            Rook.new(:black, self, [0,0]),
            Knight.new(:black, self, [0,1]),
            Bishop.new(:black, self, [0,2]),
            Queen.new(:black, self, [0,3]),
            King.new(:black, self, [0,4]),
            Bishop.new(:black, self, [0,5]),
            Knight.new(:black, self, [0,6]),
            Rook.new(:black, self, [0,7])
        ]
        white_first = [
            Rook.new(:white, self, [7,0]),
            Knight.new(:white, self, [7,1]),
            Bishop.new(:white, self, [7,2]),
            Queen.new(:white, self, [7,3]),
            King.new(:white, self, [7,4]),
            Bishop.new(:white, self, [7,5]),
            Knight.new(:white, self, [7,6]),
            Rook.new(:white, self, [7,7])
        ]
        skele[1].each_with_index do |ele, i|
            skele[1][i] = Pawn.new(:black, self, [1, i])
        end
        skele[6].each_with_index do |ele, i|
            skele[6][i] = Pawn.new(:white, self, [6, i])
        end
        skele[0] = black_first
        skele[7] = white_first
        skele
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

    def valid_pos?(position)
        range = (0..7).to_a
        range.include?(position[0]) && range.include?(position[1])
    end

end

chess = Board.new
display = Display.new(chess)
display.render
# chess.move_piece([0,0], [4,4])
# p chess

# board1 = Board.new -> piece instances
# board = Board.new
# piece = Piece.new('black', self, [0,0])