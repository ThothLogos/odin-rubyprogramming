class View

  def intro_splash
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
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
    puts "|       \\:\\/:/Z/________\\;\\/:/Z/             Press enter to begin...          |"
    puts "|        \\::/Z/____________\\/Z/                                               |"
    puts "|         \\/ZZZZZZZZZZZZZZZZZ/                                                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def main_menu
    sleep 0.2
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Mastermind    __..-----'''            `.          |"
    puts "|                                        <            `\.           '\\         |"
    puts "|   2. CPU Breaker v Player Mastermind  :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|   3. Player v Player                     `:\\ M  i         `.            `+. |"
    puts "|                                            `:. A  n  m      `.  __.===::::;)|"
    puts "|   4. How to Play                     r   a   `: e       ___.__>'::::::a:f/' |"
    puts "|                                 t          D   `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|   5. About                         j  s         '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|___________________________________________________________2015_ThothLogos___|"
    print "  Please enter your choice: "
  end

  def how_to_play
    sleep 0.2
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                     __          ___  __      __                             |"
    puts "|               |__| /  \\ |  |     |  /  \\    |__) |     /\\  \\ /              |"
    puts "|               |  | \\__/ |/\\|     |  \\__/    |    |___ /~~\\  |               |"
    puts "|                                                                             |"
    puts "|  Turn  Guesses  Feedback                                                    |"
    puts "|       ,_______.             As the Breaker you have 12 turns to correctly   |"
    puts "|    1  |1|2|3|4|  !*       guess a secret 4-digit code of the Maker. Only    |"
    puts "|    2  |1|3|5|6|  !*       numbers 1-6 are valid, duplicates are ok. At the  |"
    puts "|    3  |1|4|1|2|  *        end of each turn you will be given feedback to    |"
    puts "|    4  |2|3|4|6|  !!*      adjust your next attempt.                         |"
    puts "|    5  |2|3|3|4|  !!                                                         |"
    puts "|    6  |2|3|6|4|  !!*        As the Maker you will attempt to stump the CPU  |"
    puts "|    7  |3|3|4|4|  !!!      or a friend with a secret 4-digit code. Only use  |"
    puts "|    8  |4|3|4|4|  !!!      numbers 1-6, duplicates are ok.                   |"
    puts "|    9  |5|3|4|4|  !!!                                                        |"
    puts "|   10  |6|3|4|4|  Win!               --||  Feedback Symbols  ||--            |"
    puts "|   11  | | | | |                                                             |"
    puts "|   12  |_|_|_|_|            ! = A number is correct and correctly placed     |"
    puts "|                           * = A number is correct but not correctly placed  |"
    puts "|  Code: 6 3 4 4 (Hidden)                                                     |"
    puts "|_____________________________________________________________________________|"
    print "  Press enter to return to the Main Menu..."
    gets
  end

  def game_state

  end


  def game_win
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
    puts "|     __                __   ___            __  ___  __   __     __        __ |"
    puts "|\\ / /  \\ |  |     /\\  |__) |__     \\  / | /  `  |  /  \\ |__) | /  \\ |  | /__`|"
    puts "| |  \\__/ \\__/    /~~\\ |  \\ |___     \\/  | \\__,  |  \\__/ |  \\ | \\__/ \\__/ .__/|"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___________________________________________________________2015_ThothLogos___|"
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
    puts "|___________________________________________________________2015_ThothLogos___|"
    print "  Perhaps next time. Would you like to play again? (y/n) "
    if gets == "y" || gets == "Y" || gets = "yes" || gets = "Yes" || gets = "YES"
      main_menu
    else
      abort("Thanks for playing!"); end
  end

  def about
    sleep 0.2
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
    puts "|                        --==|| ASCII Artwork ||==--                          |"
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
    puts "|___________________________________________________________2015_ThothLogos___|"
    print "  Press enter to return to the Main Menu..."
    gets
  end

end