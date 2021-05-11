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
    #     row, col = self.pos 
    #     i = 1
    #     while i < 7
    #         if col + i < 8
    #             HORIZONTAL_DIRS << [row,col + i]
    #         end
    #         i += 1
    #     end
    #     j = 1
    #     while j < 7
    #         if col - j >= 0
    #             HORIZONTAL_DIRS << [row,col - j]
    #         end
    #         j += 1
    #     end
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    #     row, col = self.pos 
    #     i = 1
    #     while i < 7
    #         if row + i < 8
    #             HORIZONTAL_DIRS << [row + i,col]
    #         end
    #         i += 1
    #     end
    #     j = 1
    #     while j < 7
    #         if row - j >= 0
    #             HORIZONTAL_DIRS << [row - j,col]
    #         end
    #         j += 1
    #     end
    end

    def move_dirs
    end

    def moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
    end
    
end