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
    
    @view.show_main_menu

  end

end


game = Game.new