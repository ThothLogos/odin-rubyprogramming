# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.

require_relative 'view.rb'
require_relative 'mastermind.rb'
require_relative 'gamedata.rb'

class Game

  def initialize
    turns = 0
    @data = GameData.new
    @ai = Mastermind.new
    @view = View.new
    @view.intro_splash_animate
    gets
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
    code = @ai.generate_code
    @view.game_state_animation
    @continue = true
    while @continue == true
        turns = turns.to_i + 1
        @view.game_state(nil, turns)
        nums = []
        print "  Go ahead, take a shot - you'll get it this time: "
        input = gets.chomp
        input.each_char do |c|
            if c.to_i.is_a? Integer
                nums << c.to_i; end
        end
        puts "Attempt: " + nums.to_s
        sleep 2
        @data.store_attempt(nums)
        puts @data.getattempts.to_s
        sleep 5
        if turns >= 3
            @continue = false
        end
    end
  end

end

game = Game.new