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

  def update_board(marker_placement)

end

class Player
  @@who_turn = 1
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def player_turn
    puts "It is #{self.name}'s turn..."
    if @@who_turn == 1
      puts "Where would you like to place your \"X\"?...>>"
      x_placement = gets.chomp
      game1.update_board(x_placement) # likely need to ask in two parts, which row? then which horizontal location
      @@who_turn = 2
    else
      puts "Where would you like to place your \"O\"?...>>"
      o_placement = gets.chomp
      game1.update_board(o_placement)
      @@who_turn = 1
    end

    
  end
end

class PlayerX < Player
end

class PlayerO < Player
end

game1 = Board.new
game1.inital_board

print "What is player 1's name? >>"
player1 = PlayerX.new(gets.chomp.to_s)
print "\nWhat is player 2's name? >>"
player2 = PlayerO.new(gets.chomp.to_s)

player1.player_turn
