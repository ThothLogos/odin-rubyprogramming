# The Odin Project - Section 3: Ruby Programming
# Intermediate Ruby: OOP With Ruby, No. 2 Mastermind

class View

  def challenge
    message = "So, you think I can't DEFEAT you?"
    result =  "                                 "
    challenge_animation(result)
    sleep 0.4
    
    # Looping through the message to create a real-time typing effect
    for i in 0...message.length do  
      result[i] = message[i]
      challenge_animation(result)
      # Various levels of delay to add a human feel to the message
      if i < 3
        sleep 0.12
      elsif i == 3
        sleep 1
      elsif i == 20
        sleep 0.9
      elsif i > 21 && i < 28
        sleep 0.15
      elsif i.between?(28,31)
        sleep 0.11
      else
        sleep 0.08
      end    
    end
    sleep 2

    # After the first message is complete, fade out the letters randomly
    until is_blank?(result)
      changed = false
      until changed
        # Select a random position in the message
        target = rand(message.length)
        # If it's not already blank, make it blank
        if result[target] != " "
          result[target] = " "
          # We changed it - flip the flag to break the loop
          changed = true; end 
      end
      # Redraw, add a bit of delay
      challenge_animation(result)
      sleep 0.024
    end
    sleep 0.5

    face = { 1 => "                          __..--.._ ",
             2 => "  .....              .--~  .....  `.",
             3 => ".\":    \"`-..  .    .' ..-'\"    :\". `",
             4 => "` `._ ` _.'`\"(     `-\"'`._ ' _.' '  ",
             5 => "     ~~~      `.          ~~~       ",
             6 => "              .'                    ",
             7 => "             /                      ",
             8 => "            (                       ",
             9 => "             ^---'                  " }

    blank_screen
    sleep 2
    challenge_animation2(face[1],face[2],face[3],face[4],face[5],face[6],face[7],face[8],face[9])
    sleep 2
    challenge_animation3

    all_blank = false

    message = "Go ahead, pick any code you want. I'll break it. Try me."
    result  = "                                                        "
    for i in 0...message.length do  
      result[i] = message[i]
      challenge_animation3(result)
      if i < 4
        sleep 0.07
      elsif i == 14
        sleep 0.08
      elsif i > 20 && i < 28
        sleep 0.09
      elsif i == 33 || i == 48
        sleep 1.2
      else
        sleep 0.06
      end    
    end
    sleep 1.2

    # Fadeout
    until is_blank?(result)
      changed = false
      until changed
        # Select a random position in the message
        target = rand(message.length)
        # If it's not already blank, make it blank
        if result[target] != " "
          result[target] = " "
          # We changed it - flip the flag to break the loop
          changed = true; end 
      end
      # Redraw, add a bit of delay
      challenge_animation3(result)
      sleep 0.024
    end
    sleep 0.4

    message = "               I'm not looking, I swear!                "
    result  = "                                                        "

    for i in 0...message.length do  
      result[i] = message[i]
      challenge_animation3(result)
      if i < 10
        sleep 0.01
      elsif i == 30
        sleep 0.5
      elsif i > 20 && i < 28
        sleep 0.12
      else
        sleep 0.06
      end    
    end
    sleep 1

    until all_blank
      lines_blank = 0
      changed = false
      until changed
        for line in 1..9
          target = rand(face[line].length)
          if face[line][target] != " "
            face[line][target] = " "
            changed = true; end
        end      
      end
      challenge_animation2(face[1],face[2],face[3],face[4],face[5],face[6],face[7],face[8],face[9])
      sleep 0.02

      for i in 1..9
        if is_blank?(face[i])
          lines_blank += 1; end
      end
      if lines_blank >= 9
        all_blank = true; end
    end
  end

  def challenge_final
    message = "Enter a 4 digit code using 1-6 only, duplicates are ok."
    result  = "                                                       "                     
    for i in 0...message.length do  
      result[i] = message[i]
      challenge_animation1(result)
      sleep 0.02  
    end
  end

  def is_blank?(message)
    blank = true
    message.each_char do |c|
      if c != " "
        blank = false; end
    end
    return blank
  end

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
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''        5   `.          |"
    puts "|                                       <            `\\.  1        '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.     2   0    `.  L    g  o`\\       |"
    puts "|                                        `:.         o  t `.   o      s`-.    |"
    puts "|                                          `:.  T  h      h `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                              `:         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
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
    puts "| Turn  Guesses    Hits                                                       |"
    puts "|      ,_______.              As the Breaker you have 12 turns to correctly   |"
    puts "|   1  |1|2|3|4|  ! *       guess a secret 4-digit code of the Maker. Only    |"
    puts "|   2  |1|3|5|6|  ! *       numbers 1-6 are valid, duplicates are ok. At the  |"
    puts "|   3  |1|4|1|2|  *         end of each turn you will be shown your 'hits'    |"
    puts "|   4  |2|3|4|6|  ! ! *     which provide information which you can use to    |"
    puts "|   5  |2|3|3|4|  ! !       strategically deduce what the code must be.       |"
    puts "|   6  |2|3|6|4|  ! ! *       As the Maker you will attempt to stump the CPU  |"
    puts "|   7  |3|3|4|4|  ! ! !     or a friend with a secret 4-digit code. Only use  |"
    puts "|   8  |4|3|4|4|  ! ! !     numbers 1-6, duplicates are ok.                   |"
    puts "|   9  |5|3|4|4|  ! ! !                                                       |"
    puts "|  10  |6|3|4|4|  ! ! ! !               --||  Hit Notation  ||--              |" 
    puts "|  11  | | | | |  (Win!)                                                      |"
    puts "|  12  |_|_|_|_|          ! means 1 number is correct AND correctly placed    |"
    puts "|                        * means 1 number is correct but NOT correctly placed |"
    puts "| Code: 6 3 4 4 (Hidden)                                                      |"
    puts "|_____________________________________________________________________________|"
    print " Press enter to return to the Main Menu..."
    gets
  end

  def game_state(attempts = nil, hits = nil, turn = 1, code = ["?","?","?","?"], status = "    Waiting for Player   ", maker = "Code-Maker")
    sleep 0.1
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|   .-.      ,__________________________________________________. .     .-.   |"
    puts "| .'   `._.'//             __  ___  ___  __                __   \\\\ `._.'   `. |"
    puts "|(    .     \\\\  |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\  //.     .    )|"
    puts "| `.   `. ,'//  |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/  \\\\ `. ,'   .' |"
    puts "|   )   ,----------------------------.       ,-----------------------.    (   |"
    puts "| ,'   /                     Hits     \\_____/    #{maker}'s Code    \\.   `. |"
    puts "|(    (\\       ,_______.              / )-(/      ___ ___ ___ ___      \\)    )|"
    puts "| `.   /    1  |#{attempts[1][0]}|#{attempts[1][1]}|#{attempts[1][2]}|#{attempts[1][3]}|   #{hits[1][0]} #{hits[1][1]} #{hits[1][2]} #{hits[1][3]}    }'   \\     | #{code[0]} | #{code[1]} | #{code[2]} | #{code[3]} |     /   .' |"
    puts "|   )  >    2  |#{attempts[2][0]}|#{attempts[2][1]}|#{attempts[2][2]}|#{attempts[2][3]}|   #{hits[2][0]} #{hits[2][1]} #{hits[2][2]} #{hits[2][3]}    \\     \\    `---'---'---'---'    /   (   |"
    puts "| ,'   }    3  |#{attempts[3][0]}|#{attempts[3][1]}|#{attempts[3][2]}|#{attempts[3][3]}|   #{hits[3][0]} #{hits[3][1]} #{hits[3][2]} #{hits[3][3]}    }.   ,'`>---------------------<' .   `. |"
    if turn > 3
      puts "|(    (|    4  |#{attempts[4][0]}|#{attempts[4][1]}|#{attempts[4][2]}|#{attempts[4][3]}|   #{hits[4][0]} #{hits[4][1]} #{hits[4][2]} #{hits[4][3]}    \\ )-(  /  Turns Remaining: #{13-turn}   \\  )    )|"
    else
      puts "|(    (|    4  |#{attempts[4][0]}|#{attempts[4][1]}|#{attempts[4][2]}|#{attempts[4][3]}|   #{hits[4][0]} #{hits[4][1]} #{hits[4][2]} #{hits[4][3]}    \\ )-(  /  Turns Remaining: #{13-turn}  \\  )    )|"
    end
    puts "| `.   \\    5  |#{attempts[5][0]}|#{attempts[5][1]}|#{attempts[5][2]}|#{attempts[5][3]}|   #{hits[5][0]} #{hits[5][1]} #{hits[5][2]} #{hits[5][3]}    /'   `.`-----------------------' '   .' |"
    puts "|   )  /    6  |#{attempts[6][0]}|#{attempts[6][1]}|#{attempts[6][2]}|#{attempts[6][3]}|   #{hits[6][0]} #{hits[6][1]} #{hits[6][2]} #{hits[6][3]}    \\      X       X       X       X    (   |"
    puts "| ,'   }    7  |#{attempts[7][0]}|#{attempts[7][1]}|#{attempts[7][2]}|#{attempts[7][3]}|   #{hits[7][0]} #{hits[7][1]} #{hits[7][2]} #{hits[7][3]}    {.   ,' `.   ,' `.   ,' `.   ,' `.   `. |"
    puts "|(    (\\    8  |#{attempts[8][0]}|#{attempts[8][1]}|#{attempts[8][2]}|#{attempts[8][3]}|   #{hits[8][0]} #{hits[8][1]} #{hits[8][2]} #{hits[8][3]}    < )-(  ,-----------------------.  )    )|"
    puts "| `.   /    9  |#{attempts[9][0]}|#{attempts[9][1]}|#{attempts[9][2]}|#{attempts[9][3]}|   #{hits[9][0]} #{hits[9][1]} #{hits[9][2]} #{hits[9][3]}    \\'   `/#{status}\\'   .' |"
    puts "|   )  }   10  |#{attempts[10][0]}|#{attempts[10][1]}|#{attempts[10][2]}|#{attempts[10][3]}|   #{hits[10][0]} #{hits[10][1]} #{hits[10][2]} #{hits[10][3]}    /     }                         {   (   |"
    puts "| ,'   \\   11  |#{attempts[11][0]}|#{attempts[11][1]}|#{attempts[11][2]}|#{attempts[11][3]}|   #{hits[11][0]} #{hits[11][1]} #{hits[11][2]} #{hits[11][3]}    {.   .\\    Enter 'X' to Quit    /.   `. |"
    puts "|(    '}   12  |#{attempts[12][0]}|#{attempts[12][1]}|#{attempts[12][2]}|#{attempts[12][3]}|   #{hits[12][0]} #{hits[12][1]} #{hits[12][2]} #{hits[12][3]}    \\ `-'  `-----------------------'  `    )|"
    puts "| `.   \\                              /.   .' `.   .' `.   .' `.   .' `.   .' |"
    puts "|   `-' `----------------------------' ` -'     `-'     `-'     `-'     `-'   |"
    puts "|___________________________________________________________2015_ThothLogos___|"
  end

  def game_state_animation
    10.times do
      array_of_randoms = []
      4.times do
        array_of_randoms << 1 + rand(6)        
      end
      game_state_animator(array_of_randoms)
      sleep 0.15
    end
  end

  def game_state_animator(rnd, status = "        Encrypting       ")
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|   .-.      ,__________________________________________________. .     .-.   |"
    puts "| .'   `._.'//             __  ___  ___  __                __   \\\\ `._.'   `. |"
    puts "|(    .     \\\\  |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\  //.     .    )|"
    puts "| `.   `. ,'//  |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/  \\\\ `. ,'   .' |"
    puts "|   )   ,----------------------------.       ,-----------------------.    (   |"
    puts "| ,'   /                     Hits     \\_____/    Code-Maker's Code    \\.   `. |"
    puts "|(    (\\       ,_______.              / )-(/      ___ ___ ___ ___      \\)    )|"
    puts "| `.   /    1  | | | | |              }'   \\     | #{rnd[0]} | #{rnd[1]} | #{rnd[2]} | #{rnd[3]} |     /   .' |"
    puts "|   )  >    2  | | | | |              \\     \\    `---'---'---'---'    /   (   |"
    puts "| ,'   }    3  | | | | |              }.   ,'`>---------------------<' .   `. |"
    puts "|(    (|    4  | | | | |              \\ )-(  /  Turns Remaining: 12  \\  )    )|"
    puts "| `.   \\    5  | | | | |              /'   `.`-----------------------' '   .' |"
    puts "|   )  /    6  | | | | |              \\      X       X       X       X    (   |"
    puts "| ,'   }    7  | | | | |              {.   ,' `.   ,' `.   ,' `.   ,' `.   `. |"
    puts "|(    (\\    8  | | | | |              < )-(  ,-----------------------.  )    )|"
    puts "| `.   /    9  | | | | |              \\'   `/#{status}\\'   .' |"
    puts "|   )  }   10  | | | | |              /     }                         {   (   |"
    puts "| ,'   \\   11  | | | | |              {.   .\\    Enter 'X' to Quit    /.   `. |"
    puts "|(    '}   12  |_|_|_|_|              \\ `-'  `-----------------------'  `    )|"
    puts "| `.   \\                              /.   .' `.   .' `.   .' `.   .' `.   .' |"
    puts "|   `-' `----------------------------' ` -'     `-'     `-'     `-'     `-'   |"
    puts "|___________________________________________________________2015_ThothLogos___|"
    puts " Encrypting the Maker's code..."
  end

  def game_win
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|            .__---~~~(~~-_.                                                  |"
    puts "|         _-'  ) -~~- ) _-\" )_                                                |"
    puts "|        (  ( `-,_..`.,_--_ '_,)_                                             |"
    puts "|       (  -_)  ( -_-~  -_ `,    )                                            |"
    puts "|       (_ -_ _-~-__-~`, ,' )__-'))--___--~~~--__--~~--___--__..              |"
    puts "|       _ ~`_-'( (____;--==,,_))))--___--~~~--__--~~--__----~~~'`=__-~+_-_.   |"
    puts "|      (@) (@) `````      `-_(())_-~                                          |"
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
  end


  def game_loss
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|            .__---~~~(~~-_.                                                  |"
    puts "|         _-'  ) -~~- ) _-\" )_                                                |"
    puts "|        (  ( `-,_..`.,_--_ '_,)_                                             |"
    puts "|       (  -_)  ( -_-~  -_ `,    )                                            |"
    puts "|       (_ -_ _-~-__-~`, ,' )__-'))--___--~~~--__--~~--___--__..              |"
    puts "|       _ ~`_-'( (____;--==,,_))))--___--~~~--__--~~--__----~~~'`=__-~+_-_.   |"
    puts "|      (@) (@) `````      `-_(())_-~                                          |"
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
    puts "|                                 Book - af                                   |"
    puts "|                 ___                      __      ___  __                    |"
    puts "|                  |  |__|  /\\  |\\ | |__/ /__`      |  /  \\                   |"
    puts "|                  |  |  | /~~\\ | \\| |  \\ .__/      |  \\__/                   |"
    puts "|                                                                             |"
    puts "|            www.chris.com/ascii - for cataloging great ASCII art.            |"
    puts "|                                                                             |"
    puts "|                       Anthony F & Josh K for testing!                       |"
    puts "|                                                                             |"
    puts "|___________________________________________________________2015_ThothLogos___|"
    print " Press enter to return to the Main Menu..."
    gets
  end


  def intro_splash2
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|     __________________                                                      |"
    puts "|    /\\  ______________ \\                                                     |"
    puts "|   /::\\ \\ZZZZZZZZZZZZ/\\ \\                                                    |"
    puts "|  /:/\\.\\ \\        /:/\\:\\ \\                                                   |"
    puts "| /:/Z/\\:\\ \\      /:/Z/\\:\\ \\                __  ___  ___  __                __|"
    puts "|/:/Z/__\\:\\ \\____/:/Z/  \\:\\ \\    |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  |"
    puts "|:/Z/____\\:\\ \\___\\/Z/    \\:\\ \\   |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__|"
    puts "|:\\ \\ZZZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                               |"
    puts "|\\:\\ \\     \\:\\ \\ \\:\\ \\     \\:\\ \\       The One-on-One Game of Code-Breaking   |"
    puts "| \\:\\ \\     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                             |"
    puts "|  \\:\\ \\     \\:\\_________________\\                                            |"
    puts "|   \\:\\ \\    /:/ZZZZZZZZZZZZZZZZZ/                                            |"
    puts "|    \\:\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                             |"
    puts "|     \\:\\ \\/:/Z/      \\:\\ \\/:/Z/                                              |"
    puts "|      \\:\\/:/Z/________\\;\\/:/Z/                                               |"
    puts "|       \\::/Z/____________\\/Z/                 Press enter to begin...        |"
    puts "|        \\/ZZZZZZZZZZZZZZZZZ/                                                 |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash3
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|    __________________                                                       |"
    puts "|   /\\  ______________ \\                                                      |"
    puts "|  /::\\ \\ZZZZZZZZZZZZ/\\ \\                                                     |"
    puts "| /:/\\.\\ \\        /:/\\:\\ \\                                                    |"
    puts "|/:/Z/\\:\\ \\      /:/Z/\\:\\ \\                  __  ___  ___  __                _|"
    puts "|:/Z/__\\:\\ \\____/:/Z/  \\:\\ \\      |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | | |"
    puts "|/Z/____\\:\\ \\___\\/Z/    \\:\\ \\     |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |_|"
    puts "|\\ \\ZZZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                |"
    puts "|:\\ \\     \\:\\ \\ \\:\\ \\     \\:\\ \\         The One-on-One Game of Code-Breaking  |"
    puts "|\\:\\ \\     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                              |"
    puts "| \\:\\ \\     \\:\\_________________\\                                             |"
    puts "|  \\:\\ \\    /:/ZZZZZZZZZZZZZZZZZ/                                             |"
    puts "|   \\:\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                              |"
    puts "|    \\:\\ \\/:/Z/      \\:\\ \\/:/Z/                                               |"
    puts "|     \\:\\/:/Z/________\\;\\/:/Z/                                                |"
    puts "|      \\::/Z/____________\\/Z/                                                 |"
    puts "|       \\/ZZZZZZZZZZZZZZZZZ/                    Press enter to begin...       |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash4
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|   __________________                                                        |"
    puts "|  /\\  ______________ \\                                                       |"
    puts "| /::\\ \\ZZZZZZZZZZZZ/\\ \\                                                      |"
    puts "|/:/\\.\\ \\        /:/\\:\\ \\                                                     |"
    puts "|:/Z/\\:\\ \\      /:/Z/\\:\\ \\                    __  ___  ___  __                |"
    puts "|/Z/__\\:\\ \\____/:/Z/  \\:\\ \\        |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | ||"
    puts "|Z/____\\:\\ \\___\\/Z/    \\:\\ \\       |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| ||"
    puts "| \\ZZZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                 |"
    puts "|\\ \\     \\:\\ \\ \\:\\ \\     \\:\\ \\           The One-on-One Game of Code-Breaking |"
    puts "|:\\ \\     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                               |"
    puts "|\\:\\ \\     \\:\\_________________\\                                              |"
    puts "| \\:\\ \\    /:/ZZZZZZZZZZZZZZZZZ/                                              |"
    puts "|  \\:\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                               |"
    puts "|   \\:\\ \\/:/Z/      \\:\\ \\/:/Z/                                                |"
    puts "|    \\:\\/:/Z/________\\;\\/:/Z/                                                 |"
    puts "|     \\::/Z/____________\\/Z/                                                  |"
    puts "|      \\/ZZZZZZZZZZZZZZZZZ/                                                   |"
    puts "|                                               Press enter to begin...       |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash5
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|  __________________                                                         |"
    puts "| /\\  ______________ \\                                                        |"
    puts "|/::\\ \\ZZZZZZZZZZZZ/\\ \\                                                       |"
    puts "|:/\\.\\ \\        /:/\\:\\ \\                                                      |"
    puts "|/Z/\\:\\ \\      /:/Z/\\:\\ \\                      __  ___  ___  __               |"
    puts "|Z/__\\:\\ \\____/:/Z/  \\:\\ \\          |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |"
    puts "|/____\\:\\ \\___\\/Z/    \\:\\ \\         |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |"
    puts "|\\ZZZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                  |"
    puts "| \\     \\:\\ \\ \\:\\ \\     \\:\\ \\             The One-on-One Game of Code-Breaking|"
    puts "|\\ \\     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                |"
    puts "|:\\ \\     \\:\\_________________\\                                               |"
    puts "|\\:\\ \\    /:/ZZZZZZZZZZZZZZZZZ/                                               |"
    puts "| \\:\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                                |"
    puts "|  \\:\\ \\/:/Z/      \\:\\ \\/:/Z/                                                 |"
    puts "|   \\:\\/:/Z/________\\;\\/:/Z/                                                  |"
    puts "|    \\::/Z/____________\\/Z/                                                   |"
    puts "|     \\/ZZZZZZZZZZZZZZZZZ/                                                    |"
    puts "|                                                                             |"
    puts "|                                               Press enter to begin...       |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash6
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "| __________________                                                          |"
    puts "|/\\  ______________ \\                                                         |"
    puts "|::\\ \\ZZZZZZZZZZZZ/\\ \\                                                        |"
    puts "|/\\.\\ \\        /:/\\:\\ \\                                                       |"
    puts "|Z/\\:\\ \\      /:/Z/\\:\\ \\                        __  ___  ___  __              |"
    puts "|/__\\:\\ \\____/:/Z/  \\:\\ \\            |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ ||"
    puts "|____\\:\\ \\___\\/Z/    \\:\\ \\           |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\||"
    puts "|ZZZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                   |"
    puts "|\\     \\:\\ \\ \\:\\ \\     \\:\\ \\               The One-on-One Game of Code-Breakin|"
    puts "| \\     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                 |"
    puts "|\\ \\     \\:\\_________________\\                                                |"
    puts "|:\\ \\    /:/ZZZZZZZZZZZZZZZZZ/                                                |"
    puts "|\\:\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                                 |"
    puts "| \\:\\ \\/:/Z/      \\:\\ \\/:/Z/                                                  |"
    puts "|  \\:\\/:/Z/________\\;\\/:/Z/                                                   |"
    puts "|   \\::/Z/____________\\/Z/                                                    |"
    puts "|    \\/ZZZZZZZZZZZZZZZZZ/                                                     |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                               Press enter to begin...       |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash7
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|__________________                                                           |"
    puts "|\\  ______________ \\                                                          |"
    puts "|:\\ \\ZZZZZZZZZZZZ/\\ \\                                                         |"
    puts "|\\.\\ \\        /:/\\:\\ \\                                                        |"
    puts "|/\\:\\ \\      /:/Z/\\:\\ \\                          __  ___  ___  __             |"
    puts "|__\\:\\ \\____/:/Z/  \\:\\ \\              |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ |"
    puts "|___\\:\\ \\___\\/Z/    \\:\\ \\             |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\|"
    puts "|ZZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                    |"
    puts "|     \\:\\ \\ \\:\\ \\     \\:\\ \\                 The One-on-One Game of Code-Breaki|"
    puts "|\\     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                  |"
    puts "| \\     \\:\\_________________\\                                                 |"
    puts "|\\ \\    /:/ZZZZZZZZZZZZZZZZZ/                                                 |"
    puts "|:\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                                  |"
    puts "|\\:\\ \\/:/Z/      \\:\\ \\/:/Z/                                                   |"
    puts "| \\:\\/:/Z/________\\;\\/:/Z/                                                    |"
    puts "|  \\::/Z/____________\\/Z/                                                     |"
    puts "|   \\/ZZZZZZZZZZZZZZZZZ/                                                      |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash8
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|_________________                                                            |"
    puts "|  ______________ \\                                                           |"
    puts "|\\ \\ZZZZZZZZZZZZ/\\ \\                                                          |"
    puts "|.\\ \\        /:/\\:\\ \\                                                         |"
    puts "|\\:\\ \\      /:/Z/\\:\\ \\                            __  ___  ___  __            |"
    puts "|_\\:\\ \\____/:/Z/  \\:\\ \\                |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\|"
    puts "|__\\:\\ \\___\\/Z/    \\:\\ \\               |  | /~~\\ .__/  |  |___ |  \\  |  | | | |"
    puts "|ZZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                     |"
    puts "|    \\:\\ \\ \\:\\ \\     \\:\\ \\                   The One-on-One Game of Code-Break|"
    puts "|     \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                   |"
    puts "|\\     \\:\\_________________\\                                                  |"
    puts "| \\    /:/ZZZZZZZZZZZZZZZZZ/                                                  |"
    puts "|\\ \\  /:/Z/    \\:\\ \\  /:/Z/                                                   |"
    puts "|:\\ \\/:/Z/      \\:\\ \\/:/Z/                                                    |"
    puts "|\\:\\/:/Z/________\\;\\/:/Z/                                                     |"
    puts "| \\::/Z/____________\\/Z/                                                      |"
    puts "|  \\/ZZZZZZZZZZZZZZZZZ/                                                       |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash9
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|________________                                                             |"
    puts "| ______________ \\                                                            |"
    puts "| \\ZZZZZZZZZZZZ/\\ \\                                                           |"
    puts "|\\ \\        /:/\\:\\ \\                                                          |"
    puts "|:\\ \\      /:/Z/\\:\\ \\                              __  ___  ___  __           |"
    puts "|\\:\\ \\____/:/Z/  \\:\\ \\                  |\\/|  /\\  /__`  |  |__  |__)  |\\/| | ||"
    puts "|_\\:\\ \\___\\/Z/    \\:\\ \\                 |  | /~~\\ .__/  |  |___ |  \\  |  | | ||"
    puts "|ZZ\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                      |"
    puts "|   \\:\\ \\ \\:\\ \\     \\:\\ \\                     The One-on-One Game of Code-Brea|"
    puts "|    \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                    |"
    puts "|     \\:\\_________________\\                                                   |"
    puts "|\\    /:/ZZZZZZZZZZZZZZZZZ/                                                   |"
    puts "| \\  /:/Z/    \\:\\ \\  /:/Z/                                                    |"
    puts "|\\ \\/:/Z/      \\:\\ \\/:/Z/                                                     |"
    puts "|:\\/:/Z/________\\;\\/:/Z/                                                      |"
    puts "|\\::/Z/____________\\/Z/                                                       |"
    puts "| \\/ZZZZZZZZZZZZZZZZZ/                                                        |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash10
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|_______________                                                              |"
    puts "|______________ \\                                                             |"
    puts "|\\ZZZZZZZZZZZZ/\\ \\                                                            |"
    puts "| \\        /:/\\:\\ \\                                                           |"
    puts "|\\ \\      /:/Z/\\:\\ \\                                __  ___  ___  __          |"
    puts "|:\\ \\____/:/Z/  \\:\\ \\                    |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |"
    puts "|\\:\\ \\___\\/Z/    \\:\\ \\                   |  | /~~\\ .__/  |  |___ |  \\  |  | | |"
    puts "|Z\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                       |"
    puts "|  \\:\\ \\ \\:\\ \\     \\:\\ \\                       The One-on-One Game of Code-Bre|"
    puts "|   \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                     |"
    puts "|    \\:\\_________________\\                                                    |"
    puts "|    /:/ZZZZZZZZZZZZZZZZZ/                                                    |"
    puts "|\\  /:/Z/    \\:\\ \\  /:/Z/                                                     |"
    puts "| \\/:/Z/      \\:\\ \\/:/Z/                                                      |"
    puts "|\\/:/Z/________\\;\\/:/Z/                                                       |"
    puts "|::/Z/____________\\/Z/                                                        |"
    puts "|\\/ZZZZZZZZZZZZZZZZZ/                                                         |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash11
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|______________                                                               |"
    puts "|_____________ \\                                                              |"
    puts "|ZZZZZZZZZZZZ/\\ \\                                                             |"
    puts "|\\        /:/\\:\\ \\                                                            |"
    puts "| \\      /:/Z/\\:\\ \\                                  __  ___  ___  __         |"
    puts "|\\ \\____/:/Z/  \\:\\ \\                      |\\/|  /\\  /__`  |  |__  |__)  |\\/| ||"
    puts "|:\\ \\___\\/Z/    \\:\\ \\                     |  | /~~\\ .__/  |  |___ |  \\  |  | ||"
    puts "|\\:\\ \\ZZ/\\ \\     \\:\\ \\                                                        |"
    puts "| \\:\\ \\ \\:\\ \\     \\:\\ \\                         The One-on-One Game of Code-Br|"
    puts "|  \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                      |"
    puts "|   \\:\\_________________\\                                                     |"
    puts "|   /:/ZZZZZZZZZZZZZZZZZ/                                                     |"
    puts "|  /:/Z/    \\:\\ \\  /:/Z/                                                      |"
    puts "|\\/:/Z/      \\:\\ \\/:/Z/                                                       |"
    puts "|/:/Z/________\\;\\/:/Z/                                                        |"
    puts "|:/Z/____________\\/Z/                                                         |"
    puts "|/ZZZZZZZZZZZZZZZZZ/                                                          |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash12
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|_____________                                                                |"
    puts "|____________ \\                                                               |"
    puts "|ZZZZZZZZZZZ/\\ \\                                                              |"
    puts "|        /:/\\:\\ \\                                                             |"
    puts "|\\      /:/Z/\\:\\ \\                                    __  ___  ___  __        |"
    puts "| \\____/:/Z/  \\:\\ \\                        |\\/|  /\\  /__`  |  |__  |__)  |\\/| |"
    puts "|\\ \\___\\/Z/    \\:\\ \\                       |  | /~~\\ .__/  |  |___ |  \\  |  | |"
    puts "|:\\ \\ZZ/\\ \\     \\:\\ \\                                                         |"
    puts "|\\:\\ \\ \\:\\ \\     \\:\\ \\                           The One-on-One Game of Code-B|"
    puts "| \\:\\ \\_\\;\\_\\_____\\;\\ \\                                                       |"
    puts "|  \\:\\_________________\\                                                      |"
    puts "|  /:/ZZZZZZZZZZZZZZZZZ/                                                      |"
    puts "| /:/Z/    \\:\\ \\  /:/Z/                                                       |"
    puts "|/:/Z/      \\:\\ \\/:/Z/                                                        |"
    puts "|:/Z/________\\;\\/:/Z/                                                         |"
    puts "|/Z/____________\\/Z/                                                          |"
    puts "|ZZZZZZZZZZZZZZZZZ/                                                           |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash13
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|____________                                                                 |"
    puts "|___________ \\                                                                |"
    puts "|ZZZZZZZZZZ/\\ \\                                                               |"
    puts "|       /:/\\:\\ \\                                                              |"
    puts "|      /:/Z/\\:\\ \\                                      __  ___  ___  __       |"
    puts "|\\____/:/Z/  \\:\\ \\                          |\\/|  /\\  /__`  |  |__  |__)  |\\/||"
    puts "| \\___\\/Z/    \\:\\ \\                         |  | /~~\\ .__/  |  |___ |  \\  |  ||"
    puts "|\\ \\ZZ/\\ \\     \\:\\ \\                                                          |"
    puts "|:\\ \\ \\:\\ \\     \\:\\ \\                             The One-on-One Game of Code-|"
    puts "|\\:\\ \\_\\;\\_\\_____\\;\\ \\                                                        |"
    puts "| \\:\\_________________\\                                                       |"
    puts "| /:/ZZZZZZZZZZZZZZZZZ/                                                       |"
    puts "|/:/Z/    \\:\\ \\  /:/Z/                                                        |"
    puts "|:/Z/      \\:\\ \\/:/Z/                                                         |"
    puts "|/Z/________\\;\\/:/Z/                                                          |"
    puts "|Z/____________\\/Z/                                                           |"
    puts "|ZZZZZZZZZZZZZZZZ/                                                            |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end 

  def intro_splash14
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|___________                                                                  |"
    puts "|__________ \\                                                                 |"
    puts "|ZZZZZZZZZ/\\ \\                                                                |"
    puts "|      /:/\\:\\ \\                                                               |"
    puts "|     /:/Z/\\:\\ \\                                        __  ___  ___  __      |"
    puts "|____/:/Z/  \\:\\ \\                            |\\/|  /\\  /__`  |  |__  |__)  |\\/|"
    puts "|\\___\\/Z/    \\:\\ \\                           |  | /~~\\ .__/  |  |___ |  \\  |  |"
    puts "| \\ZZ/\\ \\     \\:\\ \\                                                           |"
    puts "|\\ \\ \\:\\ \\     \\:\\ \\                               The One-on-One Game of Code|"
    puts "|:\\ \\_\\;\\_\\_____\\;\\ \\                                                         |"
    puts "|\\:\\_________________\\                                                        |"
    puts "|/:/ZZZZZZZZZZZZZZZZZ/                                                        |"
    puts "|:/Z/    \\:\\ \\  /:/Z/                                                         |"
    puts "|/Z/      \\:\\ \\/:/Z/                                                          |"
    puts "|Z/________\\;\\/:/Z/                                                           |"
    puts "|/____________\\/Z/                                                            |"
    puts "|ZZZZZZZZZZZZZZZ/                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end 

  def intro_splash15
    sleep 0.04
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|__________                                                                   |"
    puts "|_________ \\                                                                  |"
    puts "|ZZZZZZZZ/\\ \\                                                                 |"
    puts "|     /:/\\:\\ \\                                                                |"
    puts "|    /:/Z/\\:\\ \\                                          __  ___  ___  __     |"
    puts "|___/:/Z/  \\:\\ \\                              |\\/|  /\\  /__`  |  |__  |__)  |\\|"
    puts "|___\\/Z/    \\:\\ \\                             |  | /~~\\ .__/  |  |___ |  \\  | |"
    puts "|\\ZZ/\\ \\     \\:\\ \\                                                            |"
    puts "| \\ \\:\\ \\     \\:\\ \\                                 The One-on-One Game of Cod|"
    puts "|\\ \\_\\;\\_\\_____\\;\\ \\                                                          |"
    puts "|:\\_________________\\                                                         |"
    puts "|:/ZZZZZZZZZZZZZZZZZ/                                                         |"
    puts "|/Z/    \\:\\ \\  /:/Z/                                                          |"
    puts "|Z/      \\:\\ \\/:/Z/                                                           |"
    puts "|/________\\;\\/:/Z/                                                            |"
    puts "|____________\\/Z/                                                             |"
    puts "|ZZZZZZZZZZZZZZ/                                                              |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash16
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|_________                                                                    |"
    puts "|________ \\                                                                   |"
    puts "|ZZZZZZZ/\\ \\                                                                  |"
    puts "|    /:/\\:\\ \\                                                                 |"
    puts "|   /:/Z/\\:\\ \\                                            __  ___  ___  __    |"
    puts "|__/:/Z/  \\:\\ \\                                |\\/|  /\\  /__`  |  |__  |__)  ||"
    puts "|__\\/Z/    \\:\\ \\                               |  | /~~\\ .__/  |  |___ |  \\  ||"
    puts "|ZZ/\\ \\     \\:\\ \\                                                             |"
    puts "|\\ \\:\\ \\     \\:\\ \\                                   The One-on-One Game of Co|"
    puts "| \\_\\;\\_\\_____\\;\\ \\                                                           |"
    puts "|\\_________________\\                                                          |"
    puts "|/ZZZZZZZZZZZZZZZZZ/                                                          |"
    puts "|Z/    \\:\\ \\  /:/Z/                                                           |"
    puts "|/      \\:\\ \\/:/Z/                                                            |"
    puts "|________\\;\\/:/Z/                                                             |"
    puts "|___________\\/Z/                                                              |"
    puts "|ZZZZZZZZZZZZZ/                                                               |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash17
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|_______                                                                      |"
    puts "|______ \\                                                                     |"
    puts "|ZZZZZ/\\ \\                                                                    |"
    puts "|  /:/\\:\\ \\                                                                   |"
    puts "| /:/Z/\\:\\ \\                                                __  ___  ___  __  |"
    puts "|/:/Z/  \\:\\ \\                                    |\\/|  /\\  /__`  |  |__  |__) |"
    puts "|\\/Z/    \\:\\ \\                                   |  | /~~\\ .__/  |  |___ |  \\ |"
    puts "|/\\ \\     \\:\\ \\                                                               |"
    puts "|\\:\\ \\     \\:\\ \\                                       The One-on-One Game of |"
    puts "|_\\;\\_\\_____\\;\\ \\                                                             |"
    puts "|________________\\                                                            |"
    puts "|ZZZZZZZZZZZZZZZZ/                                                            |"
    puts "|    \\:\\ \\  /:/Z/                                                             |"
    puts "|     \\:\\ \\/:/Z/                                                              |"
    puts "|______\\;\\/:/Z/                                                               |"
    puts "|_________\\/Z/                                                                |"
    puts "|ZZZZZZZZZZZ/                                                                 |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash18
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|_____                                                                        |"
    puts "|____ \\                                                                       |"
    puts "|ZZZ/\\ \\                                                                      |"
    puts "|/:/\\:\\ \\                                                                     |"
    puts "|:/Z/\\:\\ \\                                                    __  ___  ___  __|"
    puts "|/Z/  \\:\\ \\                                        |\\/|  /\\  /__`  |  |__  |__|"
    puts "|Z/    \\:\\ \\                                       |  | /~~\\ .__/  |  |___ |  |"
    puts "| \\     \\:\\ \\                                                                 |"
    puts "|\\ \\     \\:\\ \\                                           The One-on-One Game o|"
    puts "|;\\_\\_____\\;\\ \\                                                               |"
    puts "|______________\\                                                              |"
    puts "|ZZZZZZZZZZZZZZ/                                                              |"
    puts "|  \\:\\ \\  /:/Z/                                                               |"
    puts "|   \\:\\ \\/:/Z/                                                                |"
    puts "|____\\;\\/:/Z/                                                                 |"
    puts "|_______\\/Z/                                                                  |"
    puts "|ZZZZZZZZZ/                                                                   |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash19
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|___                                                                          |"
    puts "|__ \\                                                                         |"
    puts "|Z/\\ \\                                                                        |"
    puts "|/\\:\\ \\                                                                       |"
    puts "|Z/\\:\\ \\                                                        __  ___  ___  |"
    puts "|/  \\:\\ \\                                            |\\/|  /\\  /__`  |  |__  ||"
    puts "|    \\:\\ \\                                           |  | /~~\\ .__/  |  |___ ||"
    puts "|     \\:\\ \\                                                                   |"
    puts "|\\     \\:\\ \\                                               The One-on-One Game|"
    puts "|_\\_____\\;\\ \\                                                                 |"
    puts "|____________\\                                                                |"
    puts "|ZZZZZZZZZZZZ/                                                                |"
    puts "|\\:\\ \\  /:/Z/                                                                 |"
    puts "| \\:\\ \\/:/Z/                                                                  |"
    puts "|__\\;\\/:/Z/                                                                   |"
    puts "|_____\\/Z/                                                                    |"
    puts "|ZZZZZZZ/                                                                     |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash20
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|_                                                                            |"
    puts "| \\                                                                           |"
    puts "|\\ \\                                                                          |"
    puts "|:\\ \\                                                                         |"
    puts "|\\:\\ \\                                                            __  ___  ___|"
    puts "| \\:\\ \\                                                |\\/|  /\\  /__`  |  |__ |"
    puts "|  \\:\\ \\                                               |  | /~~\\ .__/  |  |___|"
    puts "|   \\:\\ \\                                                                     |"
    puts "|    \\:\\ \\                                                   The One-on-One Ga|"
    puts "|_____\\;\\ \\                                                                   |"
    puts "|__________\\                                                                  |"
    puts "|ZZZZZZZZZZ/                                                                  |"
    puts "|\\ \\  /:/Z/                                                                   |"
    puts "|:\\ \\/:/Z/                                                                    |"
    puts "|\\;\\/:/Z/                                                                     |"
    puts "|___\\/Z/                                                                      |"
    puts "|ZZZZZ/                                                                       |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash21
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|\\                                                                            |"
    puts "| \\                                                                           |"
    puts "|\\ \\                                                                __  ___  _|"
    puts "|:\\ \\                                                    |\\/|  /\\  /__`  |  |_|"
    puts "|\\:\\ \\                                                   |  | /~~\\ .__/  |  |_|"
    puts "| \\:\\ \\                                                                       |"
    puts "|  \\:\\ \\                                                       The One-on-One |"
    puts "|___\\;\\ \\                                                                     |"
    puts "|________\\                                                                    |"
    puts "|ZZZZZZZZ/                                                                    |"
    puts "|\\  /:/Z/                                                                     |"
    puts "| \\/:/Z/                                                                      |"
    puts "|\\/:/Z/                                                                       |"
    puts "|_\\/Z/                                                                        |"
    puts "|ZZZ/                                                                         |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash22
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|\\                                                                    __  ___ |"
    puts "| \\                                                        |\\/|  /\\  /__`  |  |"
    puts "|\\ \\                                                       |  | /~~\\ .__/  |  |"
    puts "|:\\ \\                                                                         |"
    puts "|\\:\\ \\                                                           The One-on-On|"
    puts "|_\\;\\ \\                                                                       |"
    puts "|______\\                                                                      |"
    puts "|ZZZZZZ/                                                                      |"
    puts "| /:/Z/                                                                       |"
    puts "|/:/Z/                                                                        |"
    puts "|:/Z/                                                                         |"
    puts "|/Z/                                                                          |"
    puts "|Z/                                                                           |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash23
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                       __  __|"
    puts "|                                                            |\\/|  /\\  /__`  ||"
    puts "|\\                                                           |  | /~~\\ .__/  ||"
    puts "| \\                                                                           |"
    puts "|\\ \\                                                               The One-on-|"
    puts "|;\\ \\                                                                         |"
    puts "|____\\                                                                        |"
    puts "|ZZZZ/                                                                        |"
    puts "|:/Z/                                                                         |"
    puts "|/Z/                                                                          |"
    puts "|Z/                                                                           |"
    puts "|/                                                                            |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash24
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                         __  |"
    puts "|                                                              |\\/|  /\\  /__` |"
    puts "|                                                              |  | /~~\\ .__/ |"
    puts "|                                                                             |"
    puts "|\\                                                                   The One-o|"
    puts "| \\                                                                           |"
    puts "|__\\                                                                          |"
    puts "|ZZ/                                                                          |"
    puts "|Z/                                                                           |"
    puts "|/                                                                            |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash25
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                           __|"
    puts "|                                                                |\\/|  /\\  /__|"
    puts "|                                                                |  | /~~\\ .__|"
    puts "|                                                                             |"
    puts "|                                                                      The One|"
    puts "|                                                                             |"
    puts "|\\                                                                            |"
    puts "|/                                                                            |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash26
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                  |\\/|  /\\  /|"
    puts "|                                                                  |  | /~~\\ .|"
    puts "|                                                                             |"
    puts "|                                                                        The O|"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash27
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                    |\\/|  /\\ |"
    puts "|                                                                    |  | /~~\\|"
    puts "|                                                                             |"
    puts "|                                                                          The|"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash28
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                      |\\/|  /|"
    puts "|                                                                      |  | /~|"
    puts "|                                                                             |"
    puts "|                                                                            T|"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash29
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                        |\\/| |"
    puts "|                                                                        |  | |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash30
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                          |\\/|"
    puts "|                                                                          |  |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash31
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                            ||"
    puts "|                                                                            ||"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash32
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|___2015_ThothLogos___________________________________________________________|"
  end

  def intro_splash_animate
    intro_splash32
    intro_splash31
    intro_splash30
    intro_splash29
    intro_splash28
    intro_splash27
    intro_splash26
    intro_splash25
    intro_splash24
    intro_splash23
    intro_splash22
    intro_splash21
    intro_splash20
    intro_splash19
    intro_splash18
    intro_splash17
    intro_splash16
    intro_splash15
    intro_splash14
    intro_splash13
    intro_splash12
    intro_splash11
    intro_splash10
    intro_splash9
    intro_splash8
    intro_splash7
    intro_splash6
    intro_splash5
    intro_splash4
    intro_splash3
    intro_splash2
    intro_splash
  end

  def main_menu2
    sleep 0.4
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''    5       `.          |"
    puts "|                                       <            `\\1        o  '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.      0       `.  L        `\\       |"
    puts "|                                        `:. 2     o     h`.   g   s   `-.    |"
    puts "|                                          `:.   h    t     `o            `+. |"
    puts "|   3. How to Play                           `T.              `.  __.===::::;)|"
    puts "|                                              `:         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu3
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''    5       `.          |"
    puts "|                                       <            `\\1        o  '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.      0       `.  L        `\\       |"
    puts "|                                        `:. 2     o     h`.   g   s   `-.    |"
    puts "|                                          `:.   h    t     `o            `+. |"
    puts "|   3. How to Play                           `T.              `.  __.===::::;)|"
    puts "|                                              `:         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu4
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\5           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.  0    1      `. g  o      `\\       |"
    puts "|                                       2`:.          L   `.           `-.    |"
    puts "|                                          `:h  o           `o   s        `+. |"
    puts "|   3. How to Play                           `:.   t   h      `.  __.===::::;)|"
    puts "|                                           T  `:         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu5
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.         5    `.           `\\       |"
    puts "|                                        `:.  1          o`.           `-.    |"
    puts "|                                        0 `:.   h     g    s.            `+. |"
    puts "|   3. How to Play                   2      o`:.    L     o   `.  __.===::::;)|"
    puts "|                                        h     `:         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.t _,===:::=-'-=-\"\"\"''      |"
    puts "|                                            T    '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu6
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.  5           `.           `\\       |"
    puts "|                                        `:.      o       `.           `-.    |"
    puts "|                                        1 `:.L             `.            `+. |"
    puts "|   3. How to Play                   0       `:.      s       `.  __.===::::;)|"
    puts "|                                      o  h    `t   g   o ___.__>':::::::::/' |"
    puts "|   4. About                     2               `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                            h    '-/:::''                    |"
    puts "|                                       T          ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu7
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                       5  `:.              `.            `+. |"
    puts "|   3. How to Play                   1       o:.              `.  __.===::::;)|"
    puts "|                                              `t         ___.__>':::::::::/' |"
    puts "|   4. About                      0           L  `o  s,===:::=-'-=-\"\"\"''      |"
    puts "|                                    o       h    '-/:::''                    |"
    puts "|                                 2     T       g  ''                         |"
    puts "|   X. Quit                               h                                   |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu8
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                          `:.              `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                      5       `.         ___.__>':::::::::/' |"
    puts "|   4. About                        1        o   `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                            t    L-/:::''                    |"
    puts "|                                  0      o        ''s                        |"
    puts "|   X. Quit                                 T   h o  g                        |"
    puts "|                                     2     h                                 |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu9
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                          `:.              `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                              `.         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                    5            '-/:::''                    |"
    puts "|                                       1       o t''     s                   |"
    puts "|   X. Quit                                     h   hL                        |"
    puts "|                                     0    2  o  T    o   g                   |"
    puts "|_____________________________________________________________________________|"
    print " Please enter your choice: "
  end

  def main_menu10
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                          `:.              `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                              `.         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''       s            |"
    puts "|                                            5     ''  h    L                 |"
    puts "|   X. Quit                                  0   2   o     o   g              |"
    puts "|                                          1       ot   h                     |"
    puts "|_____________________________________________________T___o___________________|"
    print " Please enter your choice: "
  end

  def main_menu11
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                          `:.              `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                              `.         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''        o           |"
    puts "|                                                  ''  h     o                |"
    puts "|   X. Quit                                        1    o t      L    s       |"
    puts "|                                                5  0   2   T o     g         |"
    puts "|_________________________________________________________o____h______________|"
    print " Please enter your choice: "
  end

  def main_menu12
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                          `:.              `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                              `.         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''                    |"
    puts "|                                                  ''      1                  |"
    puts "|   X. Quit                                                   o     o         |"
    puts "|                                                       5 0  h   t    o   s   |"
    puts "|_________________________________________________________2_____T_o_hL__g_____|"
    print " Please enter your choice: "
  end

  def main_menu13
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                          `:.              `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                              `.         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                   1               |"
    puts "|                                                           5    h            |"
    puts "|___________________________________________________________20___T_othLogos___|"
    print " Please enter your choice: "
  end

  def main_menu14
    sleep 0.06
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________ "
    puts "|                                                                             |"
    puts "|                          __  ___  ___  __                __                 |"
    puts "|               |\\/|  /\\  /__`  |  |__  |__)  |\\/| | |\\ | |  \\                |"
    puts "|               |  | /~~\\ .__/  |  |___ |  \\  |  | | | \\| |__/                |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|      --||  Choose Game Mode ||--                                            |"
    puts "|                                                              _.             |"
    puts "|                                                     _.-----'' `\\            |"
    puts "|   1. Player Breaker v CPU Maker         __..-----'''            `.          |"
    puts "|                                       <            `\\.           '\\         |"
    puts "|   2. CPU Breaker v Player Maker       :.              `.           `\\       |"
    puts "|                                        `:.              `.           `-.    |"
    puts "|                                          `:.              `.            `+. |"
    puts "|   3. How to Play                           `:.              `.  __.===::::;)|"
    puts "|                                              `.         ___.__>':::::::::/' |"
    puts "|   4. About                                     `.  _,===:::=-'-=-\"\"\"''      |"
    puts "|                                                 '-/:::''                    |"
    puts "|                                                  ''                         |"
    puts "|   X. Quit                                                                   |"
    puts "|                                                                             |"
    puts "|___________________________________________________________2015_ThothLogos___|"
    print " Please enter your choice: "
  end

  def main_menu_animate
    main_menu
    main_menu2
    main_menu3
    main_menu4
    main_menu5
    main_menu6
    main_menu7
    main_menu8
    main_menu9
    main_menu10
    main_menu11
    main_menu12
    main_menu13
    main_menu14
  end

  def challenge_animation(message = "So, you think I can't defeat you?")
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                    ,-----------------------------------.                    |"
    puts "|                    | #{message} |                    |"
    puts "|                    `-----------------------------------'                    |"
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

  def challenge_animation1(message = "Enter a 4 digit code using 1-6 only, duplicates are ok.")
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|         ,--------------------------------------------------------.          |"
    puts "|         | #{message}|          |"
    puts "|         `--------------------------------------------------------'          |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end

  def challenge_animation2(line1,line2,line3,line4,line5,line6,line7,line8,line9)
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                     #{line1}                    |"
    puts "|                     #{line2}                    |"
    puts "|                     #{line3}                    |"
    puts "|                     #{line4}                    |"
    puts "|                     #{line5}                    |"
    puts "|                     #{line6}                    |"
    puts "|                     #{line7}                    |"
    puts "|                     #{line8}                    |"
    puts "|                     #{line9}                    |"
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

  def challenge_animation3(message = "Go ahead, pick any code you want. I'll break it. Try me.")
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                               __..--.._                     |"
    puts "|                       .....              .--~  .....  `.                    |"
    puts "|                     .\":    \"`-..  .    .' ..-'\"    :\". `                    |"
    puts "|                     ` `._ ` _.'`\"(     `-\"'`._ ' _.' '                      |"
    puts "|                          ~~~      `.          ~~~                           |"
    puts "|                                   .'                                        |"
    puts "|                                  /                                          |"
    puts "|                                 (                                           |"
    puts "|                                  ^---'                                      |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|         ,----------------------------------------------------------.        |"
    puts "|         | #{message} |        |"
    puts "|         `----------------------------------------------------------'        |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|_____________________________________________________________________________|"
  end 

  def blank_screen
    puts "\e[H\e[2J"
    puts " _____________________________________________________________________________"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
    puts "|                                                                             |"
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
end