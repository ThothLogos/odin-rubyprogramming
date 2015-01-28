# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.

require_relative 'view.rb'
require_relative 'mastermindAI.rb'
require_relative 'gamedata.rb'

class Game

  def initialize
    @turn = 1
    @new_game = true
    @ai = MastermindAI.new
    @view = View.new
    @view.intro_splash_animate
    gets
    main_menu
  end

  def main_menu
    @new_game = true
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
    
    if @new_game == true
      @turn = 1  
      @continue = true
      @data = GameData.new
      @code = @ai.generate_code
      @view.game_state_animation
      
    end

    @new_game = false
    

    while @continue == true

      valid = false
      until valid 
        @view.game_state(@data.attempts, @data.hits, @turn, @code) 
        print " Enter your potential solution to break the code: "
        input = gets.chomp
        if input == "x" || input == "X"
          @continue = false
          main_menu
        elsif input.length > 4 || input.length < 4
          puts " Enter in the format 1234 - four digits, no spaces."
          sleep 1
          next
        elsif input.include? " "
          puts " No spaces allowed. Please try again."
          sleep 1
          next
        else
          input.each_char do |char|
            if !char.to_i.between?(1,6)
              puts " Only numerals 1 through 6 are valid. Try again please."
              sleep 1
              game_loop; end
          end
        end

        break_attempt = []
        input.each_char do |c|
          break_attempt << c; end

        if @data.duplicate?(break_attempt) == true
          puts " You've used this exact combination before, try something else."
          sleep 1
          game_loop
        else
          valid = true
        end

      end

      @data.store_attempt(@turn, break_attempt)
      hits = @data.check_hits(@code, break_attempt)
      @data.store_hits(@turn, hits)
      
      if hits == ["!","!","!","!"]
        @continue = false
        @view.game_win
      elsif @turn >= 12
        @continue = false
        @view.game_loss
      end

      if !@continue
        input = gets.chomp
        if input == "y" || input == "Y" || input == "yes" || input == "Yes" || input == "YES"
          @new_game = true
          main_menu
        else
          abort("Thanks for playing!"); end
      end
          
      @turn = @turn + 1

    end
  end

end

game = Game.new