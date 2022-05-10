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
    when ["top", "left"] 
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:top_row][0] = "O"
    when  ["top", "middle"]
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:top_row][1] = "O"
    when  ["top", "right"] 
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:top_row][2] = "O"
    when ["middle", "left"] 
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:middle_row][0] = "O"
    when  ["middle", "middle"] 
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:middle_row][1] = "O"
    when  ["middle", "right"] 
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:middle_row][2] = "O"
    when ["bottom", "left"] 
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:bottom_row][0] = "O"
    when  ["bottom", "middle"] 
      $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:bottom_row][1] = "O"
    when  ["bottom", "right"]
       $who_turn == 1 ? $board_state[:top_row][0] = "X" : $board_state[:bottom_row][2] = "O"
    end
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def player_turn
    puts "It is #{name}'s turn..."
    # array to hold location of marker and clears it start of each turn
    x_placement = []
    o_placement = []

    if $who_turn == 1
      puts "What row would you like to place your \"X\"? \ntop, middle, bottom>>"
      x_placement.push(gets.downcase.chomp)
      puts "What column would you like to place your \"X\"?\n left, middle, right>>"
      x_placement.push(gets.downcase.chomp)
      return game1.update_board(x_placement)
      # sets class variable to determine player turn
      #$who_turn = 2
    else
      puts "What row would you like to place your \"O\"? \ntop, middle, bottom>>"
      o_placement.push(gets.downcase.chomp)
      puts "What column would you like to place your \"O\"?\n left, middle, right>>"
      o_placement.push(gets.downcase.chomp)
      return game1.update_board(o_placement)
      #$who_turn = 1
    end
  end
end

class PlayerX < Player
end

class PlayerO < Player
end

def game_start
  game_over = 0
  game1 = Board.new
  game1.draw_board
  print "What is player 1's name? >>"
  player1 = PlayerX.new(gets.chomp.to_s)
  print "\nWhat is player 2's name? >>"
  player2 = PlayerO.new(gets.chomp.to_s)
  $who_turn = 1
  # begin game loop
  unless game_over == 1
    $who_turn == 1 ? player1.player_turn : player2.player_turn
  end
  if $who_turn == false then game_over = 1 # fake loop end
  end
end

game_start




