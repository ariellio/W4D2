require 'colorize'
require_relative 'cursor'

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        while true
            system('clear')
            @board.grid.each_with_index do |row, i|
                pos = @cursor.cursor_pos[1]
                if @cursor.cursor_pos[0] == i
                    print row[0...pos].join(' ')
                    print row[pos].to_s.colorize(:background => :green)
                    puts row[pos+1..-1].join(' ')
                else
                    puts row.join(' ')
                end
            end
            @cursor.get_input
        end
    end

end