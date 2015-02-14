# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 2 Hangman

require_relative "view.rb"
require_relative "gamedata.rb"


class Game

  def initialize
    @view = View.new
    @view.show_intro_splash
    gets
    @view.show_main_menu_animate
    main_menu
  end

  def main_menu
    @view.show_main_menu
    print " Please enter a menu selection (1-4): "
    menu_choice = gets.chomp
    case menu_choice
      when "1"
        setup_game
      when "2"
        # load saved game
      when "3"
        @view.show_how_to_play
        gets
        main_menu
      when "4"
        @view.show_about_this_game
        gets
        main_menu
      when "X", "x", "Q", "q", "quit", "Quit", "exit", "Exit"
        abort(" Thanks for playing!")
      else
        puts " Invalid entry, please try again."
        sleep 1
        main_menu
    end
  end

  def setup_game
    @data = GameData.new
    @view.show_game_setup
    print " Please enter a menu selection (1-4): "
    difficulty = gets.chomp
    case difficulty
      when "1"
        @chances = 7
      when "2"
        @chances = 5
      when "3"
        @chances = 3
      when "4"
        @chances = 1
      else
        puts " Invalid entry, please try again."
        sleep 1
        setup_game
    end
    @turn = 1
    do_turn
  end

  def do_turn
    if @turn < 10
      @view.show_game_board(@data.solution, @data.letters, " " + @turn.to_s, @chances.to_s)
    else
      @view.show_game_board(@data.solution, @data.letters, @turn.to_s, @chances.to_s); end  
    print " Please choose a letter: "
    input = gets.chomp
    if input == "*"
      #save
    elsif input == "!"
      abort(" Thanks for playing!")
    elsif input.length > 1
      puts " Invalid entry, please try again."
      sleep 1
      do_turn
    elsif input.ord.between?(65,90) || input.ord.between?(97,122)
      input = input.downcase
      if @data.letter_used?(input)
        puts " You've used this letter previously. Try again. "
        sleep 1
        do_turn
      else
        @data.insert_letter(input); end
    else
      puts " Invalid entry, please try again."
      sleep 1
      do_turn      
    end

    if @data.letter_match?(input)
      @data.reveal_matches(input)
    else
      puts " Something went wrong."
      sleep 1
      do_turn
    end

    if @data.winning_match?
      main_menu; end

    @turn += 1
    do_turn
  end


end


game = Game.new