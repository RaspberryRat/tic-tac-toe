class Board
  attr_accessor :board
  def initialize
    @board = nil
  end

  def clear_board
    @board = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]
  end

  def draw_board
    puts "_#{@board[0][0]}_|_#{@board[0][1]}_|_#{@board[0][2]}_\n"\
    "_#{@board[1][0]}_|_#{@board[1][1]}_|_#{@board[1][2]}_\n"\
    "_#{@board[2][0]}_|_#{@board[2][1]}_|_#{@board[2][2]}_\n"\
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
    @board[marker_placement[0]][marker_placement[1]] = marker_placement[2]
    draw_board
  end

  def winner?
    case
    when @board[0][0] == 'X' && @board[1][0] == 'X' && @board[2][0] == 'X' then true # all left
    when @board[0][1] == 'X' && @board[1][1] == 'X' && @board[2][1] == 'X' then true # all middle
    when @board[0][2] == 'X' && @board[1][2] == 'X' && @board[2][2] == 'X' then true # all right
    when @board[0][0] == 'X' && @board[0][1] == 'X' && @board[0][2] == 'X' then true # all top
    when @board[1][0] == 'X' && @board[1][1] == 'X' && @board[1][2] == 'X' then true # all middle
    when @board[2][0] == 'X' && @board[2][1] == 'X' && @board[2][2] == 'X' then true # all bottom
    when @board[0][0] == 'X' && @board[1][1] == 'X' && @board[2][2] == 'X' then true # top left, middle, bottom right
    when @board[0][2] == 'X' && @board[1][1] == 'X' && @board[2][0] == 'X' then true # top right, middle, bottom left
    # same winning scenarios but for the "O" marker
    when @board[0][0] == 'O' && @board[1][0] == 'O' && @board[2][0] == 'O' then true
    when @board[0][1] == 'O' && @board[1][1] == 'O' && @board[2][1] == 'O' then true
    when @board[0][2] == 'O' && @board[1][2] == 'O' && @board[2][2] == 'O' then true
    when @board[0][0] == 'O' && @board[0][1] == 'O' && @board[0][2] == 'O' then true
    when @board[1][0] == 'O' && @board[1][1] == 'O' && @board[1][2] == 'O' then true
    when @board[2][0] == 'O' && @board[2][1] == 'O' && @board[2][2] == 'O' then true
    when @board[0][0] == 'O' && @board[1][1] == 'O' && @board[2][2] == 'O' then true
    when @board[0][2] == 'O' && @board[1][1] == 'O' && @board[2][0] == 'O' then true
    else
      puts "\nNo winner yet\n"
    end
  end

  # checks if space empty. Also feeds into convert grid that checks for a typo
  def legal_move?(marker_placement)
    if convert_grid(marker_placement) == false
      puts '\n\nError, you have mistyped your choice, please choose again.\n\n'
    else
      board_empty?(marker_placement)
    end
  end

  def board_empty?(location)
    return true if @board[location[0]][location[1]] == '_'

    false
  end
end
