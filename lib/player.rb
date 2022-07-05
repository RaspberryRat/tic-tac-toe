class Player < Game
  attr_reader :name
  @@player_count = 0

  def initialize
    @@player_count += 1
    @@player_count == 1 ? player_name_count = "Player One" : player_name_count = "Player Two"
    puts "#{player_name_count}, what is your name?>>"
    @name = gets.chomp
    puts "Welcome #{name}"
    @name = name
  end

  def self.reset_player
    @@player_count = 0
  end
end