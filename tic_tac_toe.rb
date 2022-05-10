# Create a player class
# 2 subclasses from player class, X class and y class
# board will be another class. Draws each time. Classes can write
# to each spot on board. Board can be represented by array of arrays?


class Board
  $board_state = {
    top_row: ['_', '_', '_'],
    middle_row: ['_', '_', '_'],
    bottom_row: ['_', '_', '_']
  }

  def draw_board
    #3.times do
      puts "_#{$board_state[:top_row][0]}_|_#{$board_state[:top_row][1]}_|_#{$board_state[:top_row][2]}_\n"\
      "_#{$board_state[:middle_row][0]}_|_#{$board_state[:middle_row][1]}_|_#{$board_state[:middle_row][2]}_\n"\
      "_#{$board_state[:bottom_row][0]}_|_#{$board_state[:bottom_row][1]}_|_#{$board_state[:bottom_row][2]}_\n"
    #end
  end

  def update_board(marker_placement)
    case marker_placement
      when ["top", "left"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when  ["top", "middle"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when  ["top", "right"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when ["middle", "left"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when  ["middle", "middle"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when  ["middle", "right"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when ["bottom", "left"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when  ["bottom", "middle"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
      when  ["bottom", "right"] then if $who_turn == 1 then $board_state[:top_row][0] = "X" else $board_state[:top_row][0] = "O"
  end
end

class Player
  $who_turn = 1
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def player_turn
    puts "It is #{self.name}'s turn..."
    x_placement = [] # array to hold location of marker and clears it start of each turn
    o_placement = []

    if @$who_turn == 1
      puts "What row would you like to place your \"X\"? \ntop, middle, bottom>>"
      x_placement.push(gets.downcase.chomp)
      puts "What column would you like to place your \"X\"?\n left, middle, right>>"
      x_placement.push(gets.downcase.chomp)
      game1.update_board(x_placement)
      @$who)_who_turn = 2 #sets class variable to determine player turn
    else
      puts "What row would you like to place your \"O\"? \ntop, middle, bottom>>"
      o_placement.push(gets.downcase.chomp)
      puts "What column would you like to place your \"O\"?\n left, middle, right>>"
      o_placement.push(gets.downcase.chomp)
      game1.update_board(o_placement)
      @$who)_who_turn = 1
    end
  end
end

class PlayerX < Player
end

class PlayerO < Player
end

game1 = Board.new
game1.draw_board

print "What is player 1's name? >>"
player1 = PlayerX.new(gets.chomp.to_s)
print "\nWhat is player 2's name? >>"
player2 = PlayerO.new(gets.chomp.to_s)

player1.player_turn
