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
  def initialize
    puts "What is your name?>>"
    @name = gets.chomp
    puts "Welcome #{self.name}"
  end
end

class Board
  def initialize
    draw_board
  end
  def draw_board
    3.times do
      puts "__|__|__\n"
    end
  end

end

game1 = Game.new

