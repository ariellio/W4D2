require_relative 'piece.rb'
require_relative 'stepable.rb'

class Knight
    include Stepable

    def symbol
        '♞'.colorize(color)
    end

    protected
  def move_diffs
        valid = []
        row, col = pos 
        a = [-2,2]
        b = [1,-1]

        (0...2).each do |i|
          (0...2).each do |j|
            valid << [(row + a[i]), (col + b[j])]
              valid << [(row + b[j]), (col + a[i])]
          end
        end
        
        valid
    end
end