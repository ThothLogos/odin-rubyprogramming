# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 2 Mastermind - by ThothLogos

require_relative 'view.rb'
require_relative 'mastermindAI.rb'
require_relative 'gamedata.rb'

class Game

  def initialize
    @turn = 1
    @new_game = true
    @game_mode = 1
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

    case menu_choice
      when "1"
        @game_mode = 1
        mode_one_loop
      when "2"
        @game_mode = 2
        main_menu
      when "3"
        @game_mode = 3
        main_menu
      when "4"
        @view.how_to_play
      when "5"
        @view.about
      when "X", "x", "Q", "q"
        abort("Thanks for playing!")
      else
        main_menu
    end

  end

  def mode_one_loop
    
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
              mode_one_loop; end
          end
        end

        @view.game_state(@data.attempts, @data.hits, @turn, @code, "  Attempting Code Break  ")
        sleep 1

        break_attempt = []
        input.each_char do |c|
          break_attempt << c; end

        if @data.duplicate?(break_attempt) == true
          puts " You've used this exact combination before, try something else."
          sleep 1
          mode_one_loop
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


  def mode_two_loop



  end






end

game = Game.new