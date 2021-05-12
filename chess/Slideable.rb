module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [
        [0, 1],
        [1, 0],
        [-1, 0],
        [0, -1]
    ]
    DIAGONAL_DIRS = [
        [1, 1],
        [1, -1],
        [-1, -1],
        [-1, 1]
    ]


    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def move_dirs
    end

    def moves
        all_moves = []
        move_dirs.each do |ele|
            all_moves += grow_unblocked_moves_in_dir(ele[0], ele[1])
        end
        all_moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        position = [self.pos[0] + dx, self.pos[1] + dy]
        range = (0..7).to_a
        while range.include?(position[0]) && range.include?(position[1])
            if board[position].empty?
                moves << position
            end
            if self.color != board[position].color
                moves << position
                break
            end
            if self.color == board[position].color
                break
            end
            position[0], position[1] = position[0] + dx, position[1] + dy
        end
        moves
    end
    
end