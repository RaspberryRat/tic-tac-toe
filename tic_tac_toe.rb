# Create a player class
# 2 subclasses from player class, X class and y class
# board will be another class. Draws each time. Classes can write
# to each spot on board. Board can be represented by array of arrays?

class Board
  def inital_board
    3.times do
      puts "|___|___|___|\n"
    end
    board_state = {
      top_row: [false, false, false],
      middle_row: [false, false, false],
      bottom_row: [false, false, false]
    }
  end
end

game1 = Board.new
game1.inital_board
