# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 2 Hangman


class View
  
  # Short into animation
  def show_intro_splash
    logo_i = "_______________"
    logo_f = "2015_ThothLogos"
    # Rotate the Hangman logo
    2.times do
      intro_splash4
      sleep 0.1
      intro_splash3
      sleep 0.1
      intro_splash2
      sleep 0.1
      intro_splash1
      sleep 0.1
    end
    # Fill in ThothLogos logo
    for i in 0...logo_i.length
      logo_i[i] = logo_f[i]
      sleep 0.04
      intro_splash_final("Press Enter to begin...", logo_i)
    end
  end

  # Controls the fade-in effects for the text on the main menu
  def show_main_menu_animate
    logo = "2015_ThothLogos"
    # Initial strings to be displayed
    one_i = "           "
    two_i = "                  "
    three_i = "              "
    four_i = "                  "
    quit_i = "       "
    # End result
    one_f = "1. New Game"
    two_f = "2. Load Saved Game"
    three_f = "3. How to Play"
    four_f = "4. About this Game"
    quit_f = "X. Quit"

    # These will track how many letters remain to be faded in
    one_remaining = []
    two_remaining = []
    three_remaining = []
    four_remaining = []
    quit_remaining = []

    # Index the letters to be copied
    for i in 0...one_i.length do one_remaining << i end
    for i in 0...two_i.length do two_remaining << i end
    for i in 0...three_i.length do three_remaining << i end
    for i in 0...four_i.length do four_remaining << i end
    for i in 0...quit_i.length do quit_remaining << i end

    # Count up the size of each string needed to be faded-in
    sizes = [one_i.length, two_i.length, three_i.length, quit_i.length]
    max_cycles = sizes.max # Limit max animation cycles to the size of the longest string

    # Limiting to max_cycles helps to cut down on frames needed to render the effect,
    # which will help to reduce flickering effects on some consoles
    for i in 0...max_cycles
      if i < one_i.length
        # Grab a random letter that hasn't been faded-in yet
        selected = one_remaining.slice!(one_remaining.index(one_remaining.sample))
        one_i[selected] = one_f[selected]; end # Populate it for display
      if i < two_i.length
        selected = two_remaining.slice!(two_remaining.index(two_remaining.sample))
        two_i[selected] = two_f[selected]; end
      if i < three_i.length
        selected = three_remaining.slice!(three_remaining.index(three_remaining.sample))
        three_i[selected] = three_f[selected]; end
      if i < four_i.length
        selected = four_remaining.slice!(four_remaining.index(four_remaining.sample))
        four_i[selected] = four_f[selected]; end
      if i < quit_i.length
        selected = quit_remaining.slice!(quit_remaining.index(quit_remaining.sample))
        quit_i[selected] = quit_f[selected]; end      
      main_menu(one_i, two_i, three_i, four_i, quit_i, logo)
      sleep 0.03
    end    
  end


  def show_main_menu
    logo = "2015_ThothLogos"   
    one = "1. New Game"
    two = "2. Load Saved Game"
    three = "3. How to Play"
    four = "4. About this Game"
    quit = "X. Quit"
    main_menu(one, two, three, four, quit, logo)
  end

  # This method is the primary conductor of what the player sees during each
  # turn. Higher difficulties with fewer chances will see more animations per
  # each wrong selection. This method also checks a flag to see if the frame
  # sequence has been played before "rerun", and if it is set, it stays on
  # the last frame of that sequence. This prevents the player from seeing odd
  # animation repeats.
  def show_game(difficulty, solution, secret, letters, turn, chances, rerun = false)
    if difficulty == 1
      case chances
        when 7
          show_game_board1(solution, letters, turn, chances.to_s)
        when 6
          show_game_board2(solution, letters, turn, chances.to_s)
        when 5
          show_game_board3(solution, letters, turn, chances.to_s)
        when 4
          show_game_board4(solution, letters, turn, chances.to_s)
        when 3
          show_game_board5(solution, letters, turn, chances.to_s)
        when 2
          show_game_board6(solution, letters, turn, chances.to_s)
        when 1
          show_game_board7(solution, letters, turn, chances.to_s)
        else
          show_game_board8(secret, letters, turn, chances.to_s)
          sleep 2.5
      end
    elsif difficulty == 2
      case chances
        when 5
          show_game_board1(solution, letters, turn, chances.to_s)
        when 4
          if rerun == true
            show_game_board3(solution, letters, turn, chances.to_s)
          else
            show_game_board2(solution, letters, turn, chances.to_s)
            sleep 0.8
            show_game_board3(solution, letters, turn, chances.to_s)
          end
        when 3
          if rerun == true
            show_game_board5(solution, letters, turn, chances.to_s)  
          else
            show_game_board4(solution, letters, turn, chances.to_s)
            sleep 0.8
            show_game_board5(solution, letters, turn, chances.to_s)
          end
        when 2
          show_game_board6(solution, letters, turn, chances.to_s)
        when 1
          show_game_board7(solution, letters, turn, chances.to_s)
        else
          show_game_board8(secret, letters, turn, chances.to_s)
          sleep 2.5
      end
    elsif difficulty == 3
      case chances
        when 3
          show_game_board1(solution, letters, turn, chances.to_s)
        when 2
          if rerun == true  
            show_game_board4(solution, letters, turn, chances.to_s)
          else
            show_game_board2(solution, letters, turn, chances.to_s)
            sleep 0.6
            show_game_board3(solution, letters, turn, chances.to_s)
            sleep 0.6
            show_game_board4(solution, letters, turn, chances.to_s)
          end
        when 1
          if rerun == true
            show_game_board7(solution, letters, turn, chances.to_s)
          else
            show_game_board5(solution, letters, turn, chances.to_s)
            sleep 0.6
            show_game_board6(solution, letters, turn, chances.to_s)
            sleep 0.6
            show_game_board7(solution, letters, turn, chances.to_s)
          end
        else
          show_game_board8(secret, letters, turn, chances.to_s)
          sleep 2.5
      end
    elsif difficulty == 4
      case chances
        when 1
          show_game_board1(solution, letters, turn, chances.to_s)
        else 0
          show_game_board2(secret, letters, turn, chances.to_s)
          sleep 0.3
          show_game_board3(secret, letters, turn, chances.to_s)
          sleep 0.3
          show_game_board4(secret, letters, turn, chances.to_s)
          sleep 0.3
          show_game_board5(secret, letters, turn, chances.to_s)
          sleep 0.3
          show_game_board6(secret, letters, turn, chances.to_s)
          sleep 0.3
          show_game_board7(secret, letters, turn, chances.to_s)
          sleep 0.3
          show_game_board8(secret, letters, turn, chances.to_s)
          sleep 2.5
      end
    end
  end

  def intro_splash1
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|   /$$   /$$                                                                 |"
    puts "|  | $$  | $$                                                                 |"
    puts "|  | $$  | $$  /$$$$$$  /$$$$$$$   /$$$$$$  /$$$$$$/$$$$   /$$$$$$  /$$$$$$$  |"
    puts "|  | $$$$$$$$ |____  $$| $$__  $$ /$$__  $$| $$_  $$_  $$ |____  $$| $$__  $$ |"
    puts "|  | $$__  $$  /$$$$$$$| $$  \\ $$| $$  \\ $$| $$ \\ $$ \\ $$  /$$$$$$$| $$  \\ $$ |"
    puts "|  | $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$ | $$ | $$ /$$__  $$| $$  | $$ |"
    puts "|  | $$  | $$|  $$$$$$$| $$  | $$|  $$$$$$$| $$ | $$ | $$|  $$$$$$$| $$  | $$ |"
    puts "|  |__/  |__/ \\_______/|__/  |__/ \\____  $$|__/ |__/ |__/ \\_______/|__/  |__/ |"
    puts "|                                 /$$  \\ $$                                   |"
    puts "|                                |  $$$$$$/                                   |"
    puts "|                                 \\______/                                    |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end

  def intro_splash2
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|  $$\\   $$\\                                                                  |"
    puts "|  $$ |  $$ |                                                                 |"
    puts "|  $$ |  $$ | $$$$$$\\  $$$$$$$\\   $$$$$$\\  $$$$$$\\$$$$\\   $$$$$$\\  $$$$$$$\\   |"
    puts "|  $$$$$$$$ | \\____$$\\ $$  __$$\\ $$  __$$\\ $$  _$$  _$$\\  \\____$$\\ $$  __$$\\  |"
    puts "|  $$  __$$ | $$$$$$$ |$$ |  $$ |$$ /  $$ |$$ / $$ / $$ | $$$$$$$ |$$ |  $$ | |"
    puts "|  $$ |  $$ |$$  __$$ |$$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |  $$ | |"
    puts "|  $$ |  $$ |\\$$$$$$$ |$$ |  $$ |\\$$$$$$$ |$$ | $$ | $$ |\\$$$$$$$ |$$ |  $$ | |"
    puts "|  \\__|  \\__| \\_______|\\__|  \\__| \\____$$ |\\__| \\__| \\__| \\_______|\\__|  \\__| |"
    puts "|                                $$\\   $$ |                                   |"
    puts "|                                \\$$$$$$  |                                   |"
    puts "|                                 \\______/                                    |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end

  def intro_splash3
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|   __    __                                                                  |"
    puts "|  /  |  /  |                                                                 |"
    puts "|  $$ |  $$ |  ______   _______    ______   _____  ____    ______   _______   |"
    puts "|  $$ |__$$ | /      \\ /       \\  /      \\ /     \\/    \\  /      \\ /       \\  |"
    puts "|  $$    $$ | $$$$$$  |$$$$$$$  |/$$$$$$  |$$$$$$ $$$$  | $$$$$$  |$$$$$$$  | |"
    puts "|  $$$$$$$$ | /    $$ |$$ |  $$ |$$ |  $$ |$$ | $$ | $$ | /    $$ |$$ |  $$ | |"
    puts "|  $$ |  $$ |/$$$$$$$ |$$ |  $$ |$$ \\__$$ |$$ | $$ | $$ |/$$$$$$$ |$$ |  $$ | |"
    puts "|  $$ |  $$ |$$    $$ |$$ |  $$ |$$    $$ |$$ | $$ | $$ |$$    $$ |$$ |  $$ | |"
    puts "|  $$/   $$/  $$$$$$$/ $$/   $$/  $$$$$$$ |$$/  $$/  $$/  $$$$$$$/ $$/   $$/  |"
    puts "|                                /  \\__$$ |                                   |"
    puts "|                                $$    $$/                                    |"
    puts "|                                 $$$$$$/                                     |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end

  def intro_splash4
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|   __    __                                                                  |"
    puts "|  |  \\  |  \\                                                                 |"
    puts "|  | $$  | $$  ______   _______    ______   ______ ____    ______   _______   |"
    puts "|  | $$__| $$ |      \\ |       \\  /      \\ |      \\    \\  |      \\ |       \\  |"
    puts "|  | $$    $$  \\$$$$$$\\| $$$$$$$\\|  $$$$$$\\| $$$$$$\\$$$$\\  \\$$$$$$\\| $$$$$$$\\ |"
    puts "|  | $$$$$$$$ /      $$| $$  | $$| $$  | $$| $$ | $$ | $$ /      $$| $$  | $$ |"
    puts "|  | $$  | $$|  $$$$$$$| $$  | $$| $$__| $$| $$ | $$ | $$|  $$$$$$$| $$  | $$ |"
    puts "|  | $$  | $$ \\$$    $$| $$  | $$ \\$$    $$| $$ | $$ | $$ \\$$    $$| $$  | $$ |"
    puts "|   \\$$   \\$$  \\$$$$$$$ \\$$   \\$$ _\\$$$$$$$ \\$$  \\$$  \\$$  \\$$$$$$$ \\$$   \\$$ |"
    puts "|                                |  \\__| $$                                   |"
    puts "|                                 \\$$    $$                                   |"
    puts "|                                  \\$$$$$$                                    |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end

  def intro_splash_final(message, logo)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|   __    __                                                                  |"
    puts "|  |  \\  |  \\                                                                 |"
    puts "|  | $$  | $$  ______   _______    ______   ______ ____    ______   _______   |"
    puts "|  | $$__| $$ |      \\ |       \\  /      \\ |      \\    \\  |      \\ |       \\  |"
    puts "|  | $$    $$  \\$$$$$$\\| $$$$$$$\\|  $$$$$$\\| $$$$$$\\$$$$\\  \\$$$$$$\\| $$$$$$$\\ |"
    puts "|  | $$$$$$$$ /      $$| $$  | $$| $$  | $$| $$ | $$ | $$ /      $$| $$  | $$ |"
    puts "|  | $$  | $$|  $$$$$$$| $$  | $$| $$__| $$| $$ | $$ | $$|  $$$$$$$| $$  | $$ |"
    puts "|  | $$  | $$ \\$$    $$| $$  | $$ \\$$    $$| $$ | $$ | $$ \\$$    $$| $$  | $$ |"
    puts "|   \\$$   \\$$  \\$$$$$$$ \\$$   \\$$ _\\$$$$$$$ \\$$  \\$$  \\$$  \\$$$$$$$ \\$$   \\$$ |"
    puts "|                                |  \\__| $$                                   |"
    puts "|                                 \\$$    $$                                   |"
    puts "|                                  \\$$$$$$                                    |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                           #{message}                           |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___________________________________________________________#{logo}___|"
  end

  def main_menu(option1, option2, option3, option4, quit, logo)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|   __    __                                                                  |"
    puts "|  |  \\  |  \\                                                                 |"
    puts "|  | $$  | $$  ______   _______    ______   ______ ____    ______   _______   |"
    puts "|  | $$__| $$ |      \\ |       \\  /      \\ |      \\    \\  |      \\ |       \\  |"
    puts "|  | $$    $$  \\$$$$$$\\| $$$$$$$\\|  $$$$$$\\| $$$$$$\\$$$$\\  \\$$$$$$\\| $$$$$$$\\ |"
    puts "|  | $$$$$$$$ /      $$| $$  | $$| $$  | $$| $$ | $$ | $$ /      $$| $$  | $$ |"
    puts "|  | $$  | $$|  $$$$$$$| $$  | $$| $$__| $$| $$ | $$ | $$|  $$$$$$$| $$  | $$ |"
    puts "|  | $$  | $$ \\$$    $$| $$  | $$ \\$$    $$| $$ | $$ | $$ \\$$    $$| $$  | $$ |"
    puts "|   \\$$   \\$$  \\$$$$$$$ \\$$   \\$$ _\\$$$$$$$ \\$$  \\$$  \\$$  \\$$$$$$$ \\$$   \\$$ |"
    puts "|                                |  \\__| $$                                   |"
    puts "|                                 \\$$    $$                                   |"
    puts "|                                  \\$$$$$$                                    |"
    puts "|       #{option1}                                 #{option3}            |"
    puts "|                                                                             |"
    puts "|       #{option2}                          #{option4}        |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|       #{quit}                                                               |"
    puts "|                                                                             |"
    puts "|___________________________________________________________#{logo}___|"
  end

  def show_about_this_game
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|           __   __       ___    ___         __       __              ___     |"
    puts "|      /\\  |__) /  \\ |  |  |      |  |__| | /__`     / _`  /\\   |\\/| |__      |"
    puts "|     /~~\\ |__) \\__/ \\__/  |      |  |  | | .__/     \\__> /~~\\  |  | |___     |"
    puts "|                                                                             |"
    puts "|   All code and design/implementation done by ThothLogos. Project sourced    |"
    puts "|      from The Odin Project collaborate development training community.      |"
    puts "|                                                                             |"
    puts "|                         --==|| ASCII Artwork ||==--                         |"
    puts "|                                                                             |"
    puts "|               \"Hangman\" Text Logo - patorjk.com/software/taag               |"
    puts "|                                                                             |"
    puts "|                             Gallows - ThothLogos                            |"
    puts "|                                                                             |"
    puts "|                 ___                      __      ___  __                    |"
    puts "|                  |  |__|  /\\  |\\ | |__/ /__`      |  /  \\                   |"
    puts "|                  |  |  | /~~\\ | \\| |  \\ .__/      |  \\__/                   |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                       Anthony F & Josh K for testing!                       |"
    puts "|                                                                             |"
    puts "|___________________________________________________________2015_ThothLogos___|"
    print " Press enter to return to the Main Menu..."
  end

  def show_how_to_play
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                     __          ___  __      __                             |"
    puts "|               |__| /  \\ |  |     |  /  \\    |__) |     /\\  \\ /              |"
    puts "|               |  | \\__/ |/\\|     |  \\__/    |    |___ /~~\\  |               |"
    puts "|                                                                             |"
    puts "|                                               ,____________________   _     |"
    puts "|                                               \\ ___ ___ ___ ___ ___  /_\\\    |"
    puts "|    Attempt to prevent stickman's death by     {| f | e |   | r | .  |/ \\\\   |"
    puts "|  revealing the hidden word! Each turn, you    /`---'---'---'---'--- |   \\\\  |"
    puts "|  can select a single letter to uncover if     `-------------------- |   ||  |"
    puts "|  it is present in the hidden word.                                  *   ||  |"
    puts "|    Be careful though! Each wrong guess will        Letters Used     O   ||  |"
    puts "|  reduce your \"chances\" by one, sending the                              ||  |"
    puts "|  stickman closer to death. The difficulty               ef              ||  |"
    puts "|  controls how many chances you start with.              r               ||  |"
    puts "|    You can save your game at any time by                       +------+.||  |"
    puts "|  entering the '*' command. You can also quit      o            |`.  TT ``|. |"
    puts "|  from within the game using '!'.                 /O\\          '`. `+------+ |"
    puts "|                                                   U         .'`. `.|      | |"
    puts "|                                                   ]      ,.```. `.'|      | |"
    puts "|                                                  / \\     |``.,_`/| |      | |"
    puts "|_____________________________________________________________________________|"
    print " Press enter to return to the Main Menu..."
  end

  def show_game_setup
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                              Select Difficulty                              |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                            1.  Easy (7 Chances)                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                            2.  Normal (5 Chances)                           |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                            3.  Hard (3 Chances)                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                            4.  Very Hard (1 Chance)                         |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end

  def show_game_board1(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              *   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              O   ||    |"
    puts "|   < |-------------------------| |                  {                  ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /                  ||    |"
    puts "|   / '-------------------------' \\                  \\                  ||    |"
    puts "|   \\                             /------------------'         +------+.||    |"
    puts "|    '---------------------------'                             |`.  TT ``|.   |"
    puts "|        o                                                    '`. `+------+   |"
    puts "|      /O\\_                                                 .'`. `.|      |   |"
    puts "|      ,U_,`                                             ,.```. `.'|      |   |"
    puts "|     ,__\\|                                              |``.,_`/| |      |   |"
    puts "|     | |                                    .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 


  def show_game_board2(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              *   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              O   ||    |"
    puts "|   < |-------------------------| |                  {                  ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /                  ||    |"
    puts "|   / '-------------------------' \\                  \\                  ||    |"
    puts "|   \\                             /------------------'         +------+.||    |"
    puts "|    '---------------------------'                             |`.  TT ``|.   |"
    puts "|         o                                                   '`. `+------+   |"
    puts "|       _/O\\                                                .'`. `.|      |   |"
    puts "|      ,__U`                                             ,.```. `.'|      |   |"
    puts "|     ,__,|\\                                             |``.,_`/| |      |   |"
    puts "|     | | | \\                                .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 

  def show_game_board3(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              *   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              O   ||    |"
    puts "|   < |-------------------------| |                  {                  ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /                  ||    |"
    puts "|   / '-------------------------' \\                  \\                  ||    |"
    puts "|   \\                             /------------------'         +------+.||    |"
    puts "|    '---------------------------'                             |`.  TT ``|.   |"
    puts "|                   o                                         '`. `+------+   |"
    puts "|       _,_        /O\\                                      .'`. `.|      |   |"
    puts "|      ,__,`        U                                    ,.```. `.'|      |   |"
    puts "|     ,__,|        /|                                    |``.,_`/| |      |   |"
    puts "|     | |         / |                        .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 

  def show_game_board4(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              *   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              O   ||    |"
    puts "|   < |-------------------------| |                  {                  ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /                  ||    |"
    puts "|   / '-------------------------' \\                  \\                  ||    |"
    puts "|   \\                             /------------------'         +------+.||    |"
    puts "|    '---------------------------'                             |`.  TT ``|.   |"
    puts "|                              o                              '`. `+------+   |"
    puts "|       _,_                   /O\\                           .'`. `.|      |   |"
    puts "|      ,__,`                   U                         ,.```. `.'|      |   |"
    puts "|     ,__,|                    |\\                        |``.,_`/| |      |   |"
    puts "|     | |                      ||            .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 

  def show_game_board5(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              *   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              O   ||    |"
    puts "|   < |-------------------------| |                  {                  ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /                  ||    |"
    puts "|   / '-------------------------' \\                  \\                  ||    |"
    puts "|   \\                             /------------------'         +------+.||    |"
    puts "|    '---------------------------'            o                |`.  TT ``|.   |"
    puts "|                                            /O\\              '`. `+------+   |"
    puts "|       _,_                                   U             .'`. `.|      |   |"
    puts "|      ,__,`                                 / \\         ,.```. `.'|      |   |"
    puts "|     ,__,|                                  |  \\        |``.,_`/| |      |   |"
    puts "|     | |                                    .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 

  def show_game_board6(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              *   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              O   ||    |"
    puts "|   < |-------------------------| |                  {                  ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /                  ||    |"
    puts "|   / '-------------------------' \\                  \\                  ||    |"
    puts "|   \\                             /------------------'         +------+.||    |"
    puts "|    '---------------------------'                          o  |`.  TT ``|.   |"
    puts "|                                                          O\\ '`. `+------+   |"
    puts "|       _,_                                                U_'`. `.|      |   |"
    puts "|      ,__,`                                             ,/``\\. `.'|      |   |"
    puts "|     ,__,|                                              /``.,_`/| |      |   |"
    puts "|     | |                                    .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 

  def show_game_board7(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              *   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              o   ||    |"
    puts "|   < |-------------------------| |                  {             /O\\  ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /              U   ||    |"
    puts "|   / '-------------------------' \\                  \\              [   ||    |"
    puts "|   \\                             /------------------'         +----[-+.||    |"
    puts "|    '---------------------------'                             |`.  TT ``|.   |"
    puts "|                                                             '`. `+------+   |"
    puts "|       _,_                                                 .'`. `.|      |   |"
    puts "|      ,__,`                                             ,.```. `.'|      |   |"
    puts "|     ,__,|                                              |``.,_`/| |      |   |"
    puts "|     | |                                    .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 

  def show_game_board8(solution, letters, turn, chances)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     ,_________________________________________________.                     |"
    puts "|     \\ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ /                     |"
    puts "|     {| #{solution[0]} | #{solution[1]} | #{solution[2]} | #{solution[3]} | #{solution[4]} | #{solution[5]} | #{solution[6]} | #{solution[7]} | #{solution[8]} | #{solution[9]} | #{solution[10]} | #{solution[11]} |}                     |"
    puts "|     /`---'---'---'---'---'---'---'---'---'---'---'---'\\             _       |"
    puts "|     `-------------------------------------------------'            /_\\      |"
    puts "|                                                                   |/ \\\\     |"
    puts "|    .---------------------------.                                  |   \\\\    |"
    puts "|   /        Letters  Used        \\------------------.              |   ||    |"
    puts "|   \\ ._________________________. /                  /              |   ||    |"
    puts "|   { |#{letters[0]}.#{letters[1]}.#{letters[2]}.#{letters[3]}.#{letters[4]}.#{letters[5]}.#{letters[6]}.#{letters[7]}.#{letters[8]}.#{letters[9]}.#{letters[10]}.#{letters[11]}.#{letters[12]}| } Turn: #{turn}         \\              *   ||    |"
    puts "|   < |-------------------------| |                  {              x   ||    |"
    puts "|   { |#{letters[13]}.#{letters[14]}.#{letters[15]}.#{letters[16]}.#{letters[17]}.#{letters[18]}.#{letters[19]}.#{letters[20]}.#{letters[21]}.#{letters[22]}.#{letters[23]}.#{letters[24]}.#{letters[25]}| } Chances Rem: #{chances}   /             |O|  ||    |"
    puts "|   / '-------------------------' \\                  \\              U   ||    |"
    puts "|   \\                             /------------------'         +----[-+.||    |"
    puts "|    '---------------------------'                             |`.  [  ``|.   |"
    puts "|                                                             '`. `+------+   |"
    puts "|       _,_                                                 .'`. `.|      |   |"
    puts "|      ,__,`                                             ,.```. `.'|      |   |"
    puts "|     ,__,|                                              |``.,_`/| |      |   |"
    puts "|     | |                                    .________________________________|"
    puts "|____________________________________________| * to Save your game, ! to Quit |"
  end 



  def show_game_win
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                  __              ___     __        ___  __                  |"
    puts "|                 / _`  /\\   |\\/| |__     /  \\ \\  / |__  |__)                 |"
    puts "|                 \\__> /~~\\  |  | |___    \\__/  \\/  |___ |  \\                 |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|     __                __   ___            __  ___  __   __     __        __ |"
    puts "|\\ / /  \\ |  |     /\\  |__) |__     \\  / | /  `  |  /  \\ |__) | /  \\ |  | /__`|"
    puts "| |  \\__/ \\__/    /~~\\ |  \\ |___     \\/  | \\__,  |  \\__/ |  \\ | \\__/ \\__/ .__/|"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                             Play again? (Y/N)                               |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end

  def show_game_loss
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                  __              ___     __        ___  __                  |"
    puts "|                 / _`  /\\   |\\/| |__     /  \\ \\  / |__  |__)                 |"
    puts "|                 \\__> /~~\\  |  | |___    \\__/  \\/  |___ |  \\                 |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|           __                          ___     ___              ___  __      |"
    puts "|      \\ / /  \\ |  |    |__|  /\\  \\  / |__     |__   /\\  | |    |__  |  \\     |"
    puts "|       |  \\__/ \\__/    |  | /~~\\  \\/  |___    |    /~~\\ | |___ |___ |__/     |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                             Play again? (Y/N)                               |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end 

end
