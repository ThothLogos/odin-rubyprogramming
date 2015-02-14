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
    @view.show_main_menu_animate
    main_menu
  end

  def main_menu
    
    @view.show_main_menu
    print " Please enter a menu selection (1-4): "
    menu_choice = gets.chomp
    case menu_choice
      when "1"
        new_game
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
        abort("Thanks for playing!")
      else
        main_menu # Reload menu if invalid input
    end
  end

  def new_game

    @view.show_game_setup
    print " Please enter a menu selection (1-4)"
    difficulty = gets.chomp
    case difficulty
      when "1"
        chances = "7"
      when "2"
        chances = "5"
      when "3"
        chances = "3"
      when "4"
        chances = "1"
      else
        puts " Invalid entry, please try again."
        sleep 0.1
        new_game
    end

    for i in (12 - @secret.length)..12
      @secret[i] = " "
    end
    turn = " 1"
    puts @data.letters

    @view.show_game_board(@secret, @data.letters, turn, chances)
    print " Please choose a letter: "
    input = gets.chomp
    case input
      when "*"
        #save
      when "!"
        abort("Thanks for playing!")
    end


  end


end


game = Game.new