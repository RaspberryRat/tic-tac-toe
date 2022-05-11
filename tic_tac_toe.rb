# require "pry-byebug"
class Game
  attr_reader :board

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    draw_board
    @turn = PlayerTurn.new
  end

  @@game_board = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]

  def draw_board
    @@game_board
    puts "_#{@@game_board[0][0]}_|_#{@@game_board[0][1]}_|_#{@@game_board[0][2]}_\n"\
    "_#{@@game_board[1][0]}_|_#{@@game_board[1][1]}_|_#{@@game_board[1][2]}_\n"\
    "_#{@@game_board[2][0]}_|_#{@@game_board[2][1]}_|_#{@@game_board[2][2]}_\n"\
  end
 
  def convert_grid(marker_placement)
    puts "updated grid"
    case marker_placement[0]
    when "top" then marker_placement[0] = 0
    when "middle" then marker_placement[0] = 1
    when "bottom" then marker_placement[0] = 2
    end

    case marker_placement[1]
    when "left" then marker_placement[1] = 0
    when "middle" then marker_placement[1] = 1
    when "right" then marker_placement[1] = 2
    end
    update_grid(marker_placement)
  end

  def update_grid(marker_placement)
    @@game_board[marker_placement[0]][marker_placement[1]] = marker_placement[2]
    p @@game_board
  end
end

class Player < Game
  attr_reader :name

  @@player_count = 0

  def initialize
    @@player_count += 1
    @@player_count == 1 ? player_name_count = "Player One" : player_name_count = "Player Two"
    puts "#{player_name_count}, what is your name?>>"
    @name = gets.chomp
    puts "Welcome #{name}"
  end
end

class PlayerTurn < Player
  @@player_turn = 1
  def initialize
    turn
  end

  def turn
    marker_placement = []
    puts "It is #{name}'s turn..."
    if @@player_turn == 1
      puts "What row would you like to place your \"X\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp)
      puts "What column would you like to place your \"X\"? left, middle, right?>>"
      marker_placement.push(gets.chomp)
      marker_placement.push("X")
      p marker_placement
      convert_grid(marker_placement)
      @@who_turn = 2
    elsif @@player_turn == 2
      puts "What row would you like to place your \"O\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp)
      puts "What column would you like to place your \"O\"? left, middle, right?>>"
      marker_placement.push(gets.chomp)
      marker_placement.push("O")
      @@who_turn = 1
    else
      "ERROR ERROR"
    end
  end
end

game1 = Game.new
