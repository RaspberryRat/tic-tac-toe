class Game
  attr_reader :board, :player1, :player2

  def initialize
    @player1 = Player.new(self)
    @player2 = Player.new(self)
    clear_board
    draw_board
  end

  def turn
    marker_placement = []
    puts "\nIt is #{name}'s turn...\n"
    if @@player_turn == 1
      puts "What row would you like to place your \"X\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp.downcase.strip) # puts user input in downcase and removes trailing whitespace
      puts "What column would you like to place your \"X\"? left, middle, right?>>"
      marker_placement.push(gets.chomp.downcase.strip)
      if legal_move?(marker_placement) # checks if space is empty and also checks if there is a typo
        marker_placement.push("X")
        @@player_turn = 2
        update_grid(marker_placement)
      else
        puts "***\n\nThat is not a legal move, please choose a different location:\n\n***"
        draw_board 
        turn #resets the turn
      end
    elsif @@player_turn == 2
      puts "What row would you like to place your \"O\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp.downcase.strip)
      puts "What column would you like to place your \"O\"? left, middle, right?>>"
      marker_placement.push(gets.chomp.downcase.strip)
      if legal_move?(marker_placement)
        marker_placement.push("O")
        @@player_turn = 1
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

  private

  def clear_board
    @@game_board = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]
    @@game_turn = 0
    @@player_turn = 1
  end

  def draw_board
    puts "_#{@@game_board[0][0]}_|_#{@@game_board[0][1]}_|_#{@@game_board[0][2]}_\n"\
    "_#{@@game_board[1][0]}_|_#{@@game_board[1][1]}_|_#{@@game_board[1][2]}_\n"\
    "_#{@@game_board[2][0]}_|_#{@@game_board[2][1]}_|_#{@@game_board[2][2]}_\n"\
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

  def update_grid(marker_placement) # updates the game board with the player chosen square
    @@game_board[marker_placement[0]][marker_placement[1]] = marker_placement[2]
    @@game_turn += 1
    draw_board
  end

  def legal_move?(marker_placement) # checks if space is a legal move. Also feeds into convert grid that checks for a typo
    if convert_grid(marker_placement) == false
      puts "\n\nError, you have mistyped your choice, please choose again.\n\n"
    elsif @@game_board[marker_placement[0]][marker_placement[1]] == '_'
      true
    else
      false
    end
  end

  public

  def winner?
    case
    when @@game_board[0][0] == 'X' && @@game_board[1][0] == 'X' && @@game_board[2][0] == 'X' then true # all left
    when @@game_board[0][1] == 'X' && @@game_board[1][1] == 'X' && @@game_board[2][1] == 'X' then true # all middle
    when @@game_board[0][2] == 'X' && @@game_board[1][2] == 'X' && @@game_board[2][2] == 'X' then true # all right
    when @@game_board[0][0] == 'X' && @@game_board[0][1] == 'X' && @@game_board[0][2] == 'X' then true # all top
    when @@game_board[1][0] == 'X' && @@game_board[1][1] == 'X' && @@game_board[1][2] == 'X' then true # all middle
    when @@game_board[2][0] == 'X' && @@game_board[2][1] == 'X' && @@game_board[2][2] == 'X' then true # all bottom
    when @@game_board[0][0] == 'X' && @@game_board[1][1] == 'X' && @@game_board[2][2] == 'X' then true # top left, middle, bottom right
    when @@game_board[0][2] == 'X' && @@game_board[1][1] == 'X' && @@game_board[2][0] == 'X' then true # top right, middle, bottom left
    # same winning scenarios but for the "O" marker
    when @@game_board[0][0] == 'O' && @@game_board[1][0] == 'O' && @@game_board[2][0] == 'O' then true
    when @@game_board[0][1] == 'O' && @@game_board[1][1] == 'O' && @@game_board[2][1] == 'O' then true
    when @@game_board[0][2] == 'O' && @@game_board[1][2] == 'O' && @@game_board[2][2] == 'O' then true
    when @@game_board[0][0] == 'O' && @@game_board[0][1] == 'O' && @@game_board[0][2] == 'O' then true
    when @@game_board[1][0] == 'O' && @@game_board[1][1] == 'O' && @@game_board[1][2] == 'O' then true
    when @@game_board[2][0] == 'O' && @@game_board[2][1] == 'O' && @@game_board[2][2] == 'O' then true
    when @@game_board[0][0] == 'O' && @@game_board[1][1] == 'O' && @@game_board[2][2] == 'O' then true
    when @@game_board[0][2] == 'O' && @@game_board[1][1] == 'O' && @@game_board[2][0] == 'O' then true
    else
      puts "\nNo winner yet\n"
    end
  end

  def tie_game?
    @@game_turn >= 9
  end

  public 

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
end