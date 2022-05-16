require "pry-byebug"
class Game
  attr_reader :board, :player1, :player2
  @@player_turn = 1
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    draw_board
  end

  @@game_board = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]

  def draw_board
    puts "_#{@@game_board[0][0]}_|_#{@@game_board[0][1]}_|_#{@@game_board[0][2]}_\n"\
    "_#{@@game_board[1][0]}_|_#{@@game_board[1][1]}_|_#{@@game_board[1][2]}_\n"\
    "_#{@@game_board[2][0]}_|_#{@@game_board[2][1]}_|_#{@@game_board[2][2]}_\n"\
  end

  def turn
    marker_placement = []
    puts "It is #{name}'s turn..."
    if @@player_turn == 1
      puts "What row would you like to place your \"X\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp.downcase)
      puts "What column would you like to place your \"X\"? left, middle, right?>>"
      marker_placement.push(gets.chomp.downcase)
      if legal_move?(marker_placement)
        marker_placement.push("X")
        @@player_turn = 2
        update_grid(marker_placement)
      else
        puts "\n\nThat is not a legal move, please choose a different location:\n\n"
        draw_board
        turn
      end
    elsif @@player_turn == 2
      puts "What row would you like to place your \"O\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp.downcase)
      puts "What column would you like to place your \"O\"? left, middle, right?>>"
      marker_placement.push(gets.chomp.downcase)

      if legal_move?(marker_placement)
        @@player_turn = 1
        marker_placement.push("O")
        update_grid(marker_placement)
      else
        puts "\n\nThat is not a legal move, please choose a different location:\n\n"
        draw_board
        turn
      end
    else
      "ERROR ERROR"
    end
  end

  def convert_grid(marker_placement)
    case marker_placement[0]
    when "top" then marker_placement[0] = 0
    when "middle" then marker_placement[0] = 1
    when "bottom" then marker_placement[0] = 2
    else
      return false
    end

    case marker_placement[1]
    when "left" then marker_placement[1] = 0
    when "middle" then marker_placement[1] = 1
    when "right" then marker_placement[1] = 2
    else
      return false
    end
    marker_placement
  end

  def update_grid(marker_placement)
    @@game_board[marker_placement[0]][marker_placement[1]] = marker_placement[2]
    draw_board
  end

  def legal_move?(marker_placement)
    if convert_grid(marker_placement) == false
      puts "\n\nError, you have mistyped your choice, please choose again.\n\n"
    elsif @@game_board[marker_placement[0]][marker_placement[1]] == '_'
      true
    else
      false
    end
  end

  def winner?
    case
    when @@game_board[0][0] == 'X' && @@game_board[1][0] == 'X' && @@game_board[2][0] == 'X' then true
    when @@game_board[0][1] == 'X' && @@game_board[1][1] == 'X' && @@game_board[2][1] == 'X' then true
    when @@game_board[0][2] == 'X' && @@game_board[1][2] == 'X' && @@game_board[2][2] == 'X' then true
    when @@game_board[0][0] == 'X' && @@game_board[0][1] == 'X' && @@game_board[0][2] == 'X' then true
    when @@game_board[1][0] == 'X' && @@game_board[1][1] == 'X' && @@game_board[1][2] == 'X' then true
    when @@game_board[2][0] == 'X' && @@game_board[2][1] == 'X' && @@game_board[2][2] == 'X' then true
    when @@game_board[0][0] == 'X' && @@game_board[1][1] == 'X' && @@game_board[2][2] == 'X' then true
    when @@game_board[0][2] == 'X' && @@game_board[1][1] == 'X' && @@game_board[2][0] == 'X' then true
    when @@game_board[0][0] == 'O' && @@game_board[1][0] == 'O' && @@game_board[2][0] == 'O' then true
    when @@game_board[0][1] == 'O' && @@game_board[1][1] == 'O' && @@game_board[2][1] == 'O' then true
    when @@game_board[0][2] == 'O' && @@game_board[1][2] == 'O' && @@game_board[2][2] == 'O' then true
    when @@game_board[0][0] == 'O' && @@game_board[0][1] == 'O' && @@game_board[0][2] == 'O' then true
    when @@game_board[1][0] == 'O' && @@game_board[1][1] == 'O' && @@game_board[1][2] == 'O' then true
    when @@game_board[2][0] == 'O' && @@game_board[2][1] == 'O' && @@game_board[2][2] == 'O' then true
    when @@game_board[0][0] == 'O' && @@game_board[1][1] == 'O' && @@game_board[2][2] == 'O' then true
    when @@game_board[0][2] == 'O' && @@game_board[1][1] == 'O' && @@game_board[2][0] == 'O' then true
    else puts "No winner yet\n"
    end
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
    @name = name
  end
end

def game_loop
  winner = 0
  player_turn = 1
  game1 = Game.new
  puts game1
  puts game1.player1.name
  puts game1.player2.name

  until winner == 1
    case
    when player_turn == 1

      game1.player1.turn

      game1.winner? == true ? winner = 1 : player_turn = 2
    when player_turn == 2
      game1.player2.turn

      game1.winner? == true ? winner = 1 : player_turn = 1
    else
      puts "ERROR!"
    end
  end

  if winner == 1
    game_over = player_turn == 1 ? "#{game1.player1.name} is the winner! Congratulations." : "#{game1.player2.name} is the winner! Congratulations."
    puts "\n\#{ngame_over}\n\n"
  end
end

game_loop
