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
    @turns = 1
    @newgame = true
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
    
    if @newgame
      code = @ai.generate_code
      @view.game_state_animation
    end

    @newgame = false
    @continue = true

    while @continue == true
        
      valid = false
      until valid 
        @view.game_state(nil, @turns) 
        print "  Go ahead, take a shot - you'll get it this time: "
        input = gets.chomp
        if input.length > 4 || input.length < 4
          puts "Enter in the format 1234, no spaces."
          sleep 1
          next
        elsif input.include? " "
          puts "No spaces allowed. Please try again."
          sleep 1
          next
        else
          input.each_char do |char|
            if !char.to_i.between?(1,6)
              puts "Only numerals 1 through 6 are valid. Try again please."
              sleep 1
              game_loop; end
          end
        end
        nums = []
        input.each_char do |c|
          nums << c.to_i; end
        nums.each do |num|
          if !num.is_a? (Integer)
            puts "Something went wrong, please try again."
            game_loop; end
        end
        valid = true
      end

      @data.store_attempt(nums)

      @turns = @turns + 1

      if @turns >= 12
        @continue = false; end
    end
  end

end

game = Game.new