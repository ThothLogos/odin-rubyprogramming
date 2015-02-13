# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 2 Hangman

require_relative "view.rb"
require_relative "gamedata.rb"


class Game

  def intialize
    @data = GameData.new
    @secret = @data.generate_word
    puts @secret
  end

end


game = Game.new