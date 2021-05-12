module Stepable
    
    def moves
        range = (0..7).to_a
        valid = []

        move_diffs.each do |ele|
            if range.include?(ele[0]) && range.include?(ele[1]) 
                if board[ele].empty?
                    valid << ele
                elsif self.color != board[ele].color
                    valid << ele
                end
            end
        end

        valid
    end
end

