# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 2 Mastermind - by ThothLogos

require_relative 'view.rb'
require_relative 'mastermindAI.rb'
require_relative 'gamedata.rb'

class Game

  def initialize
    # These two flags are used to control animations not repeating upon every "play again"
    @mode_one_first_run = true
    @mode_two_first_run = true
    @ai = MastermindAI.new
    # All animations and graphics are in view
    @view = View.new
    # Box slide intro
    @view.intro_splash_animate
    gets # Wait for enter
    main_menu
  end

  def main_menu
    @new_game = true # Resets setup flags for each game mode
    @continue = false
    @view.main_menu_animate # Book animation
    menu_choice = gets.chomp
    case menu_choice
      when "1"
        mode_one
        @game_mode = 1
      when "2"
        mode_two
        @game_mode = 2
      when "3"
        @view.how_to_play
        main_menu
      when "4"
        @view.about
        main_menu
      when "X", "x", "Q", "q", "quit", "Quit", "exit", "Exit"
        abort("Thanks for playing!")
      else
        main_menu # Reload menu if invalid input
    end
  end

  def mode_one

    # Only runs on first call to this mode
    if @new_game == true
      @turn = 1  
      @continue = true
      @new_game = false
      @data = GameData.new
      @code = @ai.generate_code # CPU makes random code to solve
      @view.game_state_animation # Scrambled numbers animation
    end

    # Mode one's primary game loop
    while @continue

      @view.game_state(@data.attempts, @data.hits, @turn) 
      print " Enter your potential solution to break the code: "
      input = gets.chomp
      
      # Check input, restart loop if it's bad
      mode_one if !is_good?(input)
      # Small moment of user feedback
      @view.game_state(@data.attempts, @data.hits, @turn, @code, "  Attempting Code Break  ")
      sleep 0.8 # User experience delay

      break_attempt = []
      input.each_char { |c| break_attempt << c }

      # Ask the GameData object to check the record, refuse duplicate break attempts
      if @data.duplicate?(break_attempt) == true
        puts " You've used this exact combination before, try something else."
        sleep 1
        mode_one
      end

      @data.store_attempt(@turn, break_attempt)
      hits = @data.check_hits(@code, break_attempt)
      @data.store_hits(@turn, hits)
      
      check_win(hits, game_mode)
      @turn += 1
    end
  end


  def mode_two

    if @new_game == true
      @turn = 1  
      @continue = true
      @newgame = false
      @data = GameData.new
      @view.challenge if @mode_two_first_run
      @mode_two_first_run = false
    end

    valid = false
    until valid # Input checking
      @view.challenge_final
      print " Enter a code to challenge the computer: "
      input = gets.chomp
      
      if is_good?(input)
        @code = []
        input.each_char do |char|
          @code << char.to_s; end
      else
        next
      end
      valid = true
    end # End input checking

    while @continue

      @view.game_state(@data.attempts, @data.hits, @turn, @code, "     Challenge  Mode     ")
      sleep 0.6
      @view.game_state(@data.attempts, @data.hits, @turn, @code, "   Evaluating Options    ")      
      
      break_attempt = @ai.generate_code

      until !@data.duplicate?(break_attempt)
        break_attempt = @ai.generate_code
      end

      @data.store_attempt(@turn, break_attempt)
      hits = @data.check_hits(@code, break_attempt)
      @data.store_hits(@turn, hits)
      
      sleep 1.2
      check_win(hits, game_mode)
      @turn += 1
    end
  end

  def check_win(hits, game_mode)
      
      if hits == ["!","!","!","!"]
        @continue = false
        game_mode == 1 ? @view.game_win : @view.game_loss
      elsif @turn >= 12
        @continue = false
        game_mode == 1 ? @view.game_loss : @view.game_loss
      end
      if !@continue
        input = gets.chomp
        if input == "y" || input == "Y" || input == "yes" || input == "Yes" || input == "YES"
          @new_game = true
          main_menu
        else
          abort("Thanks for playing!"); end
      end
  end


  def is_good?(input)
    if input == "x" || input == "X"
      main_menu
    elsif input.length > 4 || input.length < 4
      puts " Enter in the format 1234 - four digits, no spaces."
      sleep 1
      return false
    elsif input.include? " "
      puts " No spaces allowed. Please try again."
      sleep 1
      return false
    else
      input.each_char do |char|
      if !char.to_i.between?(1,6)
        puts " Only numerals 1 through 6 are valid. Try again please."
        sleep 1
        return false; end
      end
    end
    return true
  end





end

game = Game.new