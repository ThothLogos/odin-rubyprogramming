# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 2 Hangman

require_relative "view.rb"
require_relative "gamedata.rb"


class Game

  def initialize
    @data = GameData.new
    @view = View.new
    puts "1"
    @secret = @data.generate_word
    puts "2"
    main_menu
  end

  def main_menu
    puts "3"
    @view.show_intro_splash
    puts "4"
    puts @secret
  end

end


game = Game.new