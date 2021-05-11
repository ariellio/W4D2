module Slideable
    HORIZONTAL_DIRS = []
    DIAGONAL_DIRS = []

    def horizontal_dirs
        row, col = self.pos 
        i = 1
        while i < 7
            if col + i < 8
                HORIZONTAL_DIRS << [row,col + i]
            end
            i += 1
        end
        j = 1
        while j < 7
            if col - j >= 0
                HORIZONTAL_DIRS << [row,col - j]
            end
            j += 1
        end
    end

    
end