#require "pry-byebug"
class Game
  attr_reader :board

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    initial_grid
    draw_board
    @turn = PlayerTurn.new
  end

  def draw_board
    3.times do
      puts "__|__|__\n"
    end
  end

  def initial_grid
    game_board = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]
  end

  def update_grid
    puts "updated grid"
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
      p marker_placement
      update_grid
      @@who_turn = 2
    elsif @@player_turn == 2
      puts "What row would you like to place your \"O\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp)
      puts "What column would you like to place your \"O\"? left, middle, right?>>"
      marker_placement.push(gets.chomp)
      @@who_turn = 1
    else
      "ERROR ERROR"
    end
  end
end

game1 = Game.new
