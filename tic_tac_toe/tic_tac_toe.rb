# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.


# This in an implementation of the classic game Tic Tac Toe. I decided to
# separate the structure into three primary classes:
#
# The Game class is the primary loop class, it contains all of the procedures
# to start a game, progress through turns, and act as the interface for user
# interaction.
#
# The GameBoard class contains everything needed to set up the board, keep track
# of the board-state, place markers on the board, and check itself for a win or
# a stalemate.
#
# The Player class keeps track of player information, wins and losses, and which
# marker represents them.


class Game

  def initialize
    @continue_game = true
    @board = GameBoard.new
    show_menu
  end

  def main_loop
    @board.print
  end

  def show_menu
    puts "Would you like to play?"
      main_loop
  end

  def do_turn
  end

end


class Player

  @marker = ""
  @wins = 0
  @losses = 0

  def initialize(name)
    @name = name
  end

  def win
    @wins += 1
  end

  def lose
    @losses -= 1
  end

  def marker
    return @marker
  end

end


class GameBoard


  def initialize
    @board = { 1 => "_", 2 => "_", 3 => "_",
               4 => "_", 5 => "_", 6 => "_",
               7 => "_", 8 => "_", 9 => "_" }
    puts "Board initialized: #{@board[1]}"
  end

  def print
    puts "|#{@board[1]}|#{@board[2]}|#{@board[3]}|"
    puts "|#{@board[4]}|#{@board[5]}|#{@board[6]}|"
    puts "|#{@board[7]}|#{@board[8]}|#{@board[9]}|"

  
  end

  def place_marker(location, marker)
  end

  def game_win?
  end

  def game_stalemate?
  end


end


thisgame = Game.new