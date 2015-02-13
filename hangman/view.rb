# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 2 Hangman


class View
  

  def show_intro_splash
    logo_i = "_______________"
    logo_f = "2015_ThothLogos"
    3.times do
      intro_splash4
      sleep 0.1
      intro_splash3
      sleep 0.1
      intro_splash2
      sleep 0.1
      intro_splash1
      sleep 0.1
    end
    message = "Press Enter to begin..."

    for i in 0...logo_i.length
      logo_i[i] = logo_f[i]
      sleep 0.04
      intro_splash_final(message, logo_i)
    end
    
  end


  def show_main_menu_animate

    logo = "2015_ThothLogos"

    one_i = "           "
    two_i = "                  "
    three_i = "              "
    quit_i = "       "

    one_f = "1. New Game"
    two_f = "2. Load Saved Game"
    three_f = "3. How to Play"
    quit_f = "X. Quit"

    one_remaining = []
    two_remaining = []
    three_remaining = []
    quit_remaining = []

    for i in 0...one_i.length do one_remaining << i end
    for i in 0...two_i.length do two_remaining << i end
    for i in 0...three_i.length do three_remaining << i end
    for i in 0...quit_i.length do quit_remaining << i end

    sizes = [one_i.length, two_i.length, three_i.length, quit_i.length]
    max_cycles = sizes.max

    for i in 0...max_cycles
      if i < one_i.length
        selected = one_remaining.slice!(one_remaining.index(one_remaining.sample))
        one_i[selected] = one_f[selected]; end
      if i < two_i.length
        selected = two_remaining.slice!(two_remaining.index(two_remaining.sample))
        two_i[selected] = two_f[selected]; end
      if i < three_i.length
        selected = three_remaining.slice!(three_remaining.index(three_remaining.sample))
        three_i[selected] = three_f[selected]; end
      if i < quit_i.length
        selected = quit_remaining.slice!(quit_remaining.index(quit_remaining.sample))
        quit_i[selected] = quit_f[selected]; end      
      main_menu(one_i, two_i, three_i, quit_i, logo)
      sleep 0.03
    end    
  end


  def show_main_menu
    logo = "2015_ThothLogos"
    
    one = "1) New Game"
    two = "2) Load Saved Game"
    three = "3) How to Play"
    quit = "X. Quit"

    main_menu(one, two, three, quit, logo)
  end

  def show_how_to_play

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

  def main_menu(option1, option2, option3, quit, logo)
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
    puts "|                 #{option1}                 #{option2}              |"
    puts "|                                                                             |"
    puts "|                              #{option3}                                 |"
    puts "|                                                                             |"
    puts "|   #{quit}                                                                   |"
    puts "|___________________________________________________________#{logo}___|"
  end

end