# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 2 Hangman

class GameData

  def initialize
    @letters = []
    for i in 0..25
      letters << " "
    end
  end

  def generate_word
    dictionary_file = File.open("5desk.txt", "r")
    dictionary = []
    dictionary_file.each do |entry|
      dictionary << entry.to_s; end

    invalid = true
    while invalid
      secret = dictionary.sample.chomp
      if secret.length >= 5 && secret.length <= 12
        invalid = false; end
    end

    return secret
  end

  def letters
    @letters
  end
  
end