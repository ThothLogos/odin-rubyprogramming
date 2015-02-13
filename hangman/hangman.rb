# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 2 Hangman

require_relative "view.rb"
require_relative "gamedata.rb"


class Game

  def initialize
    @data = GameData.new
    @view = View.new
    @secret = @data.generate_word
    @view.show_intro_splash
    gets
    @view.show_main_menu_animate
    main_menu
  end

  def main_menu
    
    @view.show_main_menu
    print " Please enter a menu selection (1-3): "
    menu_choice = gets.chomp
    case menu_choice
      when "1"
        # new game
      when "2"
        # load saved game
      when "3"
        @view.show_how_to_play
        main_menu
      when "X", "x", "Q", "q", "quit", "Quit", "exit", "Exit"
        abort("Thanks for playing!")
      else
        main_menu # Reload menu if invalid input
    end
  end

end


game = Game.new