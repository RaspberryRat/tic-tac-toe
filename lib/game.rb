class Game
  attr_reader :game_board
  attr_accessor :player1, :player2

  def initialize
    @player1 = nil
    @player2 = nil
    @player_turn = 1
    @game_board = Board.new
    @game_turn = 0
    @game_board.clear_board
    @game_board.draw_board
  end

  def turn
    @game_turn += 1
    marker_placement = []
    if @player_turn == 1
      puts "\nIt is #{player1.name}'s turn...\n"
      puts "What row would you like to place your \"X\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp.downcase.strip) # puts user input in downcase and removes trailing whitespace
      puts "What column would you like to place your \"X\"? left, middle, right?>>"
      marker_placement.push(gets.chomp.downcase.strip)
      if @game_board.legal_move?(marker_placement) # checks if space is empty and also checks if there is a typo
        marker_placement.push("X")
        @player_turn = 2
        @game_board.update_grid(marker_placement)
      else
        puts "***\n\nThat is not a legal move, please choose a different location:\n\n***"
        @game_board.draw_board 
        turn #resets the turn
      end
    elsif @player_turn == 2
      puts "\nIt is #{player2.name}'s turn...\n"
      puts "What row would you like to place your \"O\"? top, middle, bottom?>>"
      marker_placement.push(gets.chomp.downcase.strip)
      puts "What column would you like to place your \"O\"? left, middle, right?>>"
      marker_placement.push(gets.chomp.downcase.strip)
      if @game_board.legal_move?(marker_placement)
        marker_placement.push("O")
        @player_turn = 1
        @game_board.update_grid(marker_placement)
      else
        puts "***\n\nThat is not a legal move, please choose a different location:\n\n***"
        @game_board.draw_board
        turn
      end
    else
      "ERROR ERROR"
    end
  end

  public

  def tie_game?
    @game_turn >= 9
  end

  def game_loop
    winner = 0
    tie_game = 0
    create_players if @player1.nil? || @player2.nil?

    puts player1.name
    puts player2.name

    until winner == 1 || tie_game == 1
      case
      when @player_turn == 1
        turn
        @game_board.winner? == true ? winner = 1 : player_turn = 2
        tie_game? == true && winner == 0 ? tie_game = 1 : tie_game = 0
      when @player_turn == 2
        turn
        @game_board.winner? == true ? winner = 1 : player_turn = 1
        tie_game? == true && winner == 0 ? tie_game = 1 : tie_game = 0
      else
        puts "ERROR!"
      end
    end
    return game_over if winner == 1

    return tie_game_over if tie_game == 1
  end

  def game_over
    winner = @player_turn == 1 ? "#{player1.name} is the winner! Congratulations." : "#{player2.name} is the winner! Congratulations."
    puts "\n\n#{winner}\n\n"
    new_game
  end

  def tie_game_over
    puts "\n\nGame was a tie, there is no winner"
    new_game
  end
  
  def new_game
    puts "Hello, would you like to play a new game of tic-tac-toe? (yes/no)?"
    answer = gets.chomp
  
    until %w[yes no].include?(answer)
      puts "Would you like to play a new game of tic-tac-toe? (yes/no)?"
      answer = gets.chomp
    end
  
    return Game.new if answer == "yes"

    exit
  end

  def create_players
    puts "\n\nPlayer 1, what is your name?>>"
    name = gets.chomp.strip
    @player1 = Player.new(self, name)
    puts "\n\nPlayer 2, what is your name?>>"
    name = gets.chomp.strip
    @player2 = Player.new(self, name)
  end
end