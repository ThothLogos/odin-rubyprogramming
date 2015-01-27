# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.


class Game

  def initialize
    @view = View.new
    @view.intro_splash
    start = gets
    main_menu
  end


  def main_menu
    @view.main_menu
    menu_choice = gets.chomp

    main_menu if menu_choice == "1"
    main_menu if menu_choice == "2"
    @view.how_to_play if menu_choice == "3"
    @view.credits if menu_choice == "4"
    abort("Thanks for playing!") if menu_choice == "5"
    main_menu if menu_choice == "\n" || menu_choice != nil
  end

end



class View

  def intro_splash
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "/                                                                             \\"
    puts "|      __________________                                                     |"
    puts "|     /\\  ______________ \\                                                    |"
    puts "|    /::\\ \\ZZZZZZZZZZZZ/\\ \\                                                   |"
    puts "|   /:/\\.\\ \\        /:/\\:\\ \\                                                  |"
    puts "|  /:/Z/\\:\\ \\      /:/Z/\\:\\ \\              __  ___  ___  __                __ |"
    puts "| /:/Z/__\\:\\ \\____/:/Z/  \\:\\ \\  |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\|"
    puts "|/:/Z/____\\:\\ \\___\\/Z/    \\:\\ \\ |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/|"
    puts "|\\:\\ \\ZZZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                              |"
    puts "| \\:\\ \\     \\:\\ \\ \\:\\ \\     \\:\\ \\     The One-on-One Game of Code-Breaking    |"
    puts "|  \\:\\ \\     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                            |"
    puts "|   \\:\\ \\     \\:\\_________________\\                                           |"
    puts "|    \\:\\ \\    /:/ZZZZZZZZZZZZZZZZZ/                                           |"
    puts "|     \\:\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                            |"
    puts "|      \\:\\ \\/:/Z/      \\:\\ \\/:/Z/                                             |"
    puts "|       \\:\\/:/Z/________\\;\\/:/Z/                                              |"
    puts "|        \\::/Z/____________\\/Z/                                               |"
    puts "|         \\/ZZZZZZZZZZZZZZZZZ/                                                |"
    puts "|                                            Press Enter to Begin...          |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "\\___2015_ThothLogos___________________________________________________________/"
  end

  def main_menu
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "/                                                                             \\"
    puts "|                                                                             |"
    puts "|                              ___                                            |"
    puts "|  |\\/|  /\\  | |\\ |      |\\/| |__  |\\ | |  |                                  |"
    puts "|  |  | /~~\\ | | \\|      |  | |___ | \\| \\__/                                  |"
    puts "|                                                            _.               |"
    puts "|                                                   _.-----'' `\\              |"
    puts "|                                       __..-----'''            `.            |"
    puts "|           1. One Player v CPU        <            `\\.           '\\          |"
    puts "|                                      :.              `.           `\\        |"
    puts "|              2. Two Player            `:.              `.           `-.     |"
    puts "|                                         `:\\ M  i         `.            `+.  |"
    puts "|             3. How to Play                `:. A  n  m      `.  __.===::::;) |"
    puts "|                                     r   a   `: e       ___.__>'::::::a:f/'  |"
    puts "|               4. Credits       t          D   `.  _,===:::=-'-=-\"\"\"''       |"
    puts "|                                                 ''                          |"
    puts "|                                                                             |"
    puts "|                5. Quit                                                      |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "\\_____________________________________________________________________________/"
    print "  Please enter your choice: "
  end

  def how_to_play
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "/                                                                             \\"
    puts "|                     __  ___  __        __  ___    __        __              |"
    puts "|             | |\\ | /__`  |  |__) |  | /  `  |  | /  \\ |\\ | /__`             |"
    puts "|             | | \\| .__/  |  |  \\ \\__/ \\__,  |  | \\__/ | \\| .__/             |"
    puts "|                                                                             |"
    puts "|      _________                                                              |"
    puts "|    1 |_|_|_|_|                                                              |"
    puts "|    2 |_|_|_|_|                                                              |"
    puts "|    3 |_|_|_|_|                                                              |"
    puts "|    4 |_|_|_|_|                                                              |"
    puts "|    5 |_|_|_|_|                                                              |"
    puts "|    6 |_|_|_|_|                                                              |"
    puts "|    7 |_|_|_|_|                                                              |"
    puts "|    8 |_|_|_|_|                                                              |"
    puts "|    9 |_|_|_|_|                                                              |"
    puts "|   10 |_|_|_|_|                                                              |"
    puts "|   11 |_|_|_|_|                                                              |"
    puts "|   12 |_|_|_|_|                                                              |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "\\_____________________________________________________________________________/"
    print "  Press enter to return to the Main Menu..."
    gets
  end

  def game_win
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "/            .__---~~~(~~-_.                                                  \\"
    puts "|         _-'  ) -~~- ) _-\" )_                                                |"
    puts "|        (  ( `-,_..`.,_--_ '_,)_                                             |"
    puts "|       (  -_)  ( -_-~  -_ `,    )                                            |"
    puts "|       (_ -_ _-~-__-~`, ,' )__-'))--___--~~~--__--~~--___--__..              |"
    puts "|       _ ~`_-'( (____;--==,,_))))--___--~~~--__--~~--__----~~~'`=__-~+_-_.   |"
    puts "|      (@) (@) `````      `-_(())_-~                                          |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                  __              ___     __        ___  __                  |"
    puts "|                 / _`  /\\   |\\/| |__     /  \\ \\  / |__  |__)                 |"
    puts "|                 \\__> /~~\\  |  | |___    \\__/  \\/  |___ |  \\                 |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|     __                __   ___            __  ___  __   __     __        __ |"
    puts "|\\ / /  \\ |  |     /\\  |__) |__     \\  / | /  `  |  /  \\ |__) | /  \\ |  | /__`|"
    puts "| |  \\__/ \\__/    /~~\\ |  \\ |___     \\/  | \\__,  |  \\__/ |  \\ | \\__/ \\__/ .__/|"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "\\_____________________________________________________________________________/"
    print "  Congratulations! Would you like to play again? (y/n) "
    if gets == "y" || gets == "Y" || gets = "yes" || gets = "Yes" || gets = "YES"
      main_menu
    else
      abort("Thanks for playing!"); end
  end


  def game_loss
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|            .__---~~~(~~-_.                                                  |"
    puts "|         _-'  ) -~~- ) _-\" )_                                                |"
    puts "|        (  ( `-,_..`.,_--_ '_,)_                                             |"
    puts "|       (  -_)  ( -_-~  -_ `,    )                                            |"
    puts "|       (_ -_ _-~-__-~`, ,' )__-'))--___--~~~--__--~~--___--__..              |"
    puts "|       _ ~`_-'( (____;--==,,_))))--___--~~~--__--~~--__----~~~'`=__-~+_-_.   |"
    puts "|      (@) (@) `````      `-_(())_-~                                          |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                  __              ___     __        ___  __                  |"
    puts "|                 / _`  /\\   |\\/| |__     /  \\ \\  / |__  |__)                 |"
    puts "|                 \\__> /~~\\  |  | |___    \\__/  \\/  |___ |  \\                 |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|           __                          ___     ___              ___  __      |"
    puts "|      \\ / /  \\ |  |    |__|  /\\  \\  / |__     |__   /\\  | |    |__  |  \\     |"
    puts "|       |  \\__/ \\__/    |  | /~~\\  \\/  |___    |    /~~\\ | |___ |___ |__/     |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "\\_____________________________________________________________________________/"
    print "  Perhaps next time. Would you like to play again? (y/n) "
    if gets == "y" || gets == "Y" || gets = "yes" || gets = "Yes" || gets = "YES"
      main_menu
    else
      abort("Thanks for playing!"); end
  end

  def credits
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "/                                                                             \\"
    puts "|                        __   __   ___  __    ___  __                         |"
    puts "|                       /  ` |__) |__  |  \\ |  |  /__`                        |"
    puts "|                       \\__, |  \\ |___ |__/ |  |  .__/                        |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                   All code and design done by ThothLogos.                   |"
    puts "|                                                                             |"
    puts "|                               ASCII Artwork                                 |"
    puts "|                                                                             |"
    puts "|                            Isometric Box - itz                              |"
    puts "|                             Flying Brain - mn                               |"
    puts "|                                Book - anon                                  |"
    puts "|                 ___                      __      ___  __                    |"
    puts "|                  |  |__|  /\\  |\\ | |__/ /__`      |  /  \\                   |"
    puts "|                  |  |  | /~~\\ | \\| |  \\ .__/      |  \\__/                   |"
    puts "|                                                                             |"
    puts "|            www.chris.com/ascii - for cataloging great ASCII art.            |"
    puts "|                                                                             |"
    puts "|                       Anthony F & Josh K for testing!                       |"
    puts "|                                                                             |"
    puts "\\___2015_ThothLogos___________________________________________________________/"
    print "  Press enter to return to the Main Menu..."
    gets
  end

end



game = Game.new