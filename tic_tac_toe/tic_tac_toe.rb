# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.
#
#
# This in an implementation of the classic game Tic Tac Toe. I went a bit above and
# beyond the bare-bones solution to this problem, trying to create a more game-like 
# experience with a user interface and some feedback. I decided to separate the structure
# into four classes:
#
# The Game class is the primary loop class, it is the entry point and conductor.
# It controls the game-state, loops to progress through turns, and defines the
# overall program flow. Game score/stats are also tracked here.
#
# The GameBoard class contains everything needed to set up the board, keep track
# of the board-state, place markers on the board, and check itself for a win or
# a stalemate.
#
# The View class mostly holds a bunch of screen output for the user that I did not
# want cluttering up the Game class.
#
# The Player class keeps track of simple player info, like their name and symbol.


class Game

  def initialize
    @view = View.new
    @score = { rounds_played: 0, turns: 0, drawn: 0, p1: 0, p2: 0}
    @continue_game = true
    @continue_round = true
    # Clear the screen and start the game
    #system("clear")
    main_menu
  end


  # The main menu is the first thing the user sees, and is very simple. You can make
  # a new game, or you can exit. This also handles setting up the players and getting
  # their names.
  def main_menu
    # Load main menu
    @view.main_menu
    selection = gets.chomp # User menu choice

    if selection == "1" # New game
      # Create player one, get name from user
      @view.player_info(1)
      name = gets.chomp
      @player_one = Player.new(name, "X")
      # Player two
      @view.player_info(2)
      name = gets.chomp
      @player_two = Player.new(name, "O")
      # Timed countdown to show the instructions for a few seconds
      for i in 1.downto(1)
        @view.instructions
        puts "The game will start in #{i}..."
        sleep 1; end
      # Setup complete, move to main game loop
      main_loop
    elsif selection == "2"
      abort(" Thanks for playing!") # Exit the game
    else # Invalid input
      @view.invalid_entry # Notify user
      sleep 1
      main_menu; end # Reload menu
  end


  def main_loop
    # Game session loop, continues until users quit
    while @continue_game

      # Increase game count
      @score[:rounds_played] += 1
      # Swap starting player each round, odd rounds = player 1, even = player 2
      (@score[:rounds_played] % 2 != 0) ? @active_player = @player_one : @active_player = @player_two

      # Reset the board and turn count
      @board = GameBoard.new      
      @continue_round = true
      @score[:turns] = 0
      # Present initial game state to users
      @view.game_state(@board, @score)

      # Begin round, continues until the current board is won or drawn
      while @continue_round

        @score[:turns] += 1
        
        print " #{@active_player.name}'s turn. Your selection: "
        location = gets.chomp
        if !location.to_i.between?(1,9) # Verify a valid number was entered
          puts " Invalid entry, please try again."
          sleep 1
          next # Break here and restart a new iteration of while
        elsif @board.place_marker(location.to_i, @active_player.marker) == "occupied" 
          puts "That spot is already taken... try again."
          sleep 1
          next; end

        # Primary game view, updated every round
        @view.game_state(@board, @score)
        # Check for full board
        @continue_round = false if @board.is_full?
        # At the end of each turn, swap out active player in preparation for the next turn
        @active_player == @player_one ? @active_player = @player_two : @active_player = @player_one
      end

      @continue_game = false if @score[:rounds_played] > 3      
    end
  end

end


class GameBoard

  # Ready an empty board
  def initialize
    @board = { 1 => "_", 2 => "_", 3 => "_",
               4 => "_", 5 => "_", 6 => "_",
               7 => "_", 8 => "_", 9 => "_" }
  end

  # Output the current board-state to the user. Also accepts a parameter to specify a single
  # row and print that without a line break.
  def print(row = nil)
    case row
    when 1
      return "|#{@board[1]}|#{@board[2]}|#{@board[3]}|"
    when 2
      return "|#{@board[4]}|#{@board[5]}|#{@board[6]}|"
    when 3
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

  def is_full?
    for i in 1..9
      if @board[i].to_s == "_"
        return false
      end
    end
    return true
  end

end

class View

  # The first thing the user sees
  def main_menu
    #system "clear"
    puts " ...::||| Main Menu |||::..."
    puts ""
    puts "        1) New Game"
    puts "         2) Exit"
    puts ""
    print " Please make your selection:"
  end

  # Main menu error variant
  def invalid_entry
    #system "clear"
    puts " ...::||| Main Menu |||::..."
    puts ""
    puts "        1) New Game"
    puts "         2) Exit"
    puts ""
    print " Invalid entry, try again! "
  end

  # Assigning symbols and taking names
  def player_info(player)
    #system "clear"
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

  # This screen runs briefly after the creation of a new game/players
  def instructions
    #system "clear"
    puts " ...::||| Instructions |||::..."
    puts " "
    puts "    Select location with 1-9"
    puts ""
    puts "            |1|2|3|"
    puts "            |4|5|6|"
    puts "            |7|8|9|"
    puts ""
  end

  # This is the primary gameplay screen that updates each turn
  def game_state(board, score)
    #system "clear"
    puts " ...::||| TicTacToe |||::..."
    puts " "
    puts "        Round #{score[:rounds_played]}, Turn #{score[:turns]}"
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

  def name
    return @name
  end

  def marker
    return @marker
  end
end


thisgame = Game.new