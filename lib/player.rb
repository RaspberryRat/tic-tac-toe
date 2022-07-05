class Player < Game
  attr_reader :name, :game

  def initialize(game, name)
    @game = game
    @name = name
    puts "Welcome #{name}"
  end
end