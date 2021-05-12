require_relative 'piece.rb'
class Pawn < Piece

    def moves
        self.forwards_steps + self.side_attacks
    end

    def symbol
        '♟'.colorize(color)
    end

    private
    def at_start_row?
        return true if self.color == 'black' && self.pos[0] == 1
        return true if self.color == 'white' && self.pos[0] == 6
        false
    end

    def forward_dir
        return 1 if self.color == 'black'
        return -1 if self.color == 'white'
    end

    def forwards_steps
        valid_moves = []
        single_move = [self.pos[0] + self.forward_dir, self.pos[1]]

        if self.at_start_row? 
            double_moves = [self.pos[0] + (self.forward_dir * 2), self.pos[1]]
            valid_moves << double_moves if board[double_moves].empty? && board[single_move].empty?
        end

        valid_moves << single_move if board[single_move].empty?
        valid_moves
    end

    def side_attacks
        valid_moves = []

        left = [self.pos[0] + self.forwards_steps, self.pos[1] - 1]
        right = [self.pos[0] + self.forwards_steps, self.pos[1] + 1]
        
        if board[left].color != self.color
            valid_moves << left
        end

        if board[right].color != self.color
            valid_moves << right
        end

        valid_moves
    end
end