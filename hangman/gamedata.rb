# The Odin Project - Section 3: Ruby Programming
# Intermediate Ruby: I/O and Serialization, No. 2 Hangman

class GameData

  def initialize
    @turn = 1
    @difficulty = 0
    @solution = ""
    @secret = generate_word.downcase
    @secret.length.times do
      @solution << " "; end
    for i in (12 - @secret.length)..12
      @secret << "."
      @solution << "."; end

    @letters = []
    for i in 0..25
      letters << " "; end

    @chances = 7
  end

  def save_game(name)
    Dir.mkdir("saves") unless Dir.exists?("saves")

    save_file = "saves/#{name}.txt"
    letters = ""
    File.open(save_file, "w") do |file|
      file.puts @difficulty.to_s
      file.puts @solution
      file.puts @secret
      @letters.each do |letter|
        letters << letter; end
      file.puts letters
      file.puts @chances.to_s
      file.puts @turn.to_s
    end
  end

  def save_exist?(name)
    if File.exists?("saves/#{name}.txt")
      return true
    else
      return false; end
  end

  def load_game(name)
    load_file = File.open("saves/#{name}.txt", "r")
    settings = []
    load_file.each do |line|
      settings << line.to_s; end
    @difficulty = settings[0].to_i
    @solution = settings[1]
    @secret = settings[2]
    letters = settings[3]
    @letters = []
    letters.split("").each do |letter|
      @letters << letter; end
    @chances = settings[4].to_i
    @turn = settings[5].to_i
  end

  def generate_word
    dictionary_file = File.open("5desk.txt", "r")
    dictionary = []
    dictionary_file.each do |entry|
      dictionary << entry.to_s; end

    invalid = true
    while invalid
      secret = dictionary.sample.chomp.downcase
      if secret.length >= 5 && secret.length <= 12
        invalid = false; end
    end
    return secret
  end

  def insert_letter(letter)
    # The input is already downcased, so we account for its ASCII value to
    # identify it then adjust accordingly for a more convenient 0-25 index
    letters[letter.ord - 97] = letter
  end

  # Checks if the player accidentally used the same letter twice
  def letter_used?(letter)
    @letters.each do |entry|
      if entry == letter
        return true; end
    end
    return false
  end

  # Checks to see if the player's guess is part of the solution
  def letter_match?(letter)
    if @secret.include?(letter)
      return true; end
    return false
  end

  # Identifies the locations of a letter match and populates the solution 
  def reveal_matches(letter)
    hits = []
    i = 0
    @secret.split("").each do |c|
      hits << i if c == letter
      i += 1
    end
    hits.each do |i|
      @solution[i] = letter
    end
    return @solution
  end

  def winning_match?
    if @solution == @secret
      return true
    else
      return false; end
  end

  def difficulty
    @difficulty
  end

  def set_difficulty(difficulty)
    @difficulty = difficulty
  end

  def letters
    @letters
  end

  def secret
    @secret
  end
  
  def solution
    @solution
  end

  def chances
    @chances
  end

  def set_chances(chances)
    @chances = chances
  end

  def remove_chance
    @chances -= 1
  end

  def turn
    @turn
  end

  def add_turn
    @turn += 1
  end

end