# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.


# This in an implementation of the classic game Tic Tac Toe. I decided to
# separate the structure into four classes:
#
# The Game class is the primary loop class, it is the entry point and conductor.
# It controls the game-state, loops to progress through turns, and defines the
# overall program flow.
#
# The GameBoard class contains everything needed to set up the board, keep track
# of the board-state, place markers on the board, and check itself for a win or
# a stalemate.
#
# The View class mostly holds a bunch of screen output for the user that I did not
# want cluttering up the Game class.
#
# The Player class keeps track of player information including the number of wins 
# and which marker represents the player.


class Game

  def initialize
    @board = GameBoard.new
    @view = View.new
    @score = { games_played: 0, drawn: 0, p1: 0, p2: 0}
    @continue_game = true

    system("clear")
    main_menu
  end

  def main_menu
    
    @view.main_menu
    selection = gets.chomp

    if selection == "1"
      @view.create_player(1)
      name = gets.chomp
      @player_one = Player.new(name, "X")

      @view.create_player(2)
      name = gets.chomp
      @player_two = Player.new(name, "O")

      for i in 5.downto(1)
        @view.instructions
        puts "The game will start in #{i}..."
        sleep 1
      end

      main_loop
    elsif selection == "2"
      abort(" Thanks for playing!")
    else
      @view.invalid_entry
      sleep 1
      main_menu
    end
  end

  def main_loop


    while @continue_game
      @view.game_state(@board, @score)
      @continue_game = false
    end
  end
end


class GameBoard

  def initialize
    @board = { 1 => "_", 2 => "_", 3 => "_",
               4 => "_", 5 => "_", 6 => "_",
               7 => "_", 8 => "_", 9 => "_" }
  end

  # Output the current board-state to the user. Also accepts a parameter to specify a single
  # row and print that without a line break.
  def print(row = nil)
    if    row == 1
      return "|#{@board[1]}|#{@board[2]}|#{@board[3]}|"
    elsif row == 2
      return "|#{@board[4]}|#{@board[5]}|#{@board[6]}|"
    elsif row == 3
      return "|#{@board[7]}|#{@board[8]}|#{@board[9]}|"
    end  
  end

  # Handles converting an empty space into a player's marker, if the space is taken
  # the method will leave it unchanged and return a message
  def place_marker(location, marker)
    if @board[location] == "_"
      @board[location] = marker
    else
      return "occupied"
    end
  end

  def game_win?
    # Check board-state for win
  end

  def cats_game?
    # Check board-state for lack of possible moves
  end

end

class View

  def initialize
    
  end

  def main_menu
    system "clear"
    puts " ...::||| Main Menu |||::..."
    puts ""
    puts "        1) New Game"
    puts "         2) Exit"
    puts ""
    print " Please make your selection:"
  end

  def invalid_entry
    system "clear"
    puts " ...::||| Main Menu |||::..."
    puts ""
    puts "        1) New Game"
    puts "         2) Exit"
    puts ""
    print " Invalid entry, try again! "
  end

  def create_player(player)
    system "clear"
    puts " ...::||| Player #{player} |||::..."
    puts ""
    if player == 1
      puts "   Your symbol will be X."
    elsif player == 2
      puts "   Your symbol will be O."; end
    puts ""
    puts ""
    print " Enter Player #{player}'s name: "
  end

  def instructions
    system "clear"
    puts " ...::||| Instructions |||::..."
    puts " "
    puts "    Select location with 1-9"
    puts ""
    puts "            |1|2|3|"
    puts "            |4|5|6|"
    puts "            |7|8|9|"
    puts ""
    puts ""
  end

  def game_state(board, score)
    system "clear"
    puts " ...::||| TicTacToe |||::..."
    puts " "
    puts "     Board         Score"
    puts ""
    puts "    #{board.print(1)}        P1:  #{score[:p1]}"
    puts "    #{board.print(2)}        P2:  #{score[:p2]}"
    puts "    #{board.print(3)}      Draw:  #{score[:drawn]}"
    puts ""
    puts ""
  end

end


class Player

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def marker
    return @marker
  end
end


thisgame = Game.new