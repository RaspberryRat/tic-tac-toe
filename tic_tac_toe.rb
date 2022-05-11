#require "pry-byebug"
class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @board = Board.new
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
    puts "Welcome #{self.name}"
  end
end

class Board
  def initialize
    initial_grid
    draw_board
  end

  def draw_board
    3.times do
      puts "__|__|__\n"
    end
  end

  def initial_grid
    game_board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  end
end

game1 = Game.new

