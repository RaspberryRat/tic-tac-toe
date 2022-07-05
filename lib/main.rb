require_relative 'game'
require_relative 'player'

def game_loop
  winner = 0
  tie_game = 0
  player_turn = 1
  game1 = Game.new
  puts game1.player1.name
  puts game1.player2.name

  until winner == 1 || tie_game == 1
    case
    when player_turn == 1
      game1.player1.turn
      game1.winner? == true ? winner = 1 : player_turn = 2
      game1.tie_game? == true && winner == 0 ? tie_game = 1 : tie_game = 0
    when player_turn == 2
      game1.player2.turn
      game1.winner? == true ? winner = 1 : player_turn = 1
      game1.tie_game? == true && winner == 0 ? tie_game = 1 : tie_game = 0
    else
      puts "ERROR!"
    end
    Player.reset_player
  end

  if winner == 1
    game_over = player_turn == 1 ? "#{game1.player1.name} is the winner! Congratulations." : "#{game1.player2.name} is the winner! Congratulations."
    puts "\n\n#{game_over}\n\n"

    new_game
  elsif tie_game == 1
    new_game
  end
end

def new_game
  puts "Hello, would you like to play a new game of tic-tac-toe? (yes/no)?"
  answer = gets.chomp

  until %w[yes no].include?(answer)
    puts "Would you like to play a new game of tic-tac-toe? (yes/no)?"
    answer = gets.chomp
  end

  game_loop if answer == "yes"
end

new_game
