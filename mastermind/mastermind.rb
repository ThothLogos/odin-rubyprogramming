# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.

require_relative 'view.rb'

class Game

  def initialize
    turns = 0
    @game_mode = 0
    @view = View.new
    @view.intro_splash_animate
    start = gets
    main_menu
  end


  def main_menu
    @view.main_menu_animate
    menu_choice = gets.chomp

    game_loop if menu_choice == "1"
    main_menu if menu_choice == "2"
    main_menu if menu_choice == "3"
    @view.how_to_play if menu_choice == "4"
    @view.about if menu_choice == "5"
    abort("Thanks for playing!") if menu_choice == "X" || menu_choice == "x"
    main_menu if menu_choice == "\n" || menu_choice != nil
  end


  def game_loop
    @continue = true
    while @continue == true
        turns = turns.to_i + 1
        @view.game_state(nil, turns)
        sleep 0.2










        if turns >= 12
            @continue = false
        end
    end
  end


end







game = Game.new