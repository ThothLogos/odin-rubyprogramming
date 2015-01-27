# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.

require_relative 'view.rb'

class Game

  def initialize
    @view = View.new
    @view.intro_splash
    start = gets
    main_menu
  end


  def main_menu
    @view.main_menu
    menu_choice = gets.chomp

    main_menu if menu_choice == "1"
    main_menu if menu_choice == "2"
    main_menu if menu_choice == "3"
    @view.how_to_play if menu_choice == "4"
    @view.about if menu_choice == "5"
    abort("Thanks for playing!") if menu_choice == "X" || menu_choice == "x"
    main_menu if menu_choice == "\n" || menu_choice != nil
  end

end







game = Game.new