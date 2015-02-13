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
    main_menu
  end

  def main_menu
    
    @view.show_main_menu_animate

    valid = false
    until valid
      @view.show_main_menu
      print " Please select a menu option: "
      input = gets.chomp
      if input.to_i.is_a? Integer
        input = input.to_i
        if input >= 1 && input <= 3
          valid = true; end
      else
        sleep 0.2
        puts " Invalid entry, please try again."
        sleep 0.5
      end
    end
  end

end


game = Game.new