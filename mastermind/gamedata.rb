# The Odin Project - Section 3: Ruby Programming
# Intermediate Ruby: OOP With Ruby, No. 2 Mastermind

class GameData

  def initialize
    @attempts = Hash.new
    @hits = Hash.new
    for i in 1..12
      @attempts[i] = [" ", " ", " ", " "]
      @attempts[i] = ["_", "_", "_", "_"] if i == 12
      @hits[i] = [" ", " ", " ", " "]
    end
  end

  def duplicate?(break_attempt)
    for i in 1..12
      if @attempts[i] == break_attempt
        return true; end
    end
    return false
  end
   
  def check_hits(code, attempt)
    
    # Check for exact match right away
    return ["!", "!", "!", "!"] if code == attempt
    
    # Temp array which will hold numbers we've already counted, to ensure hits are exclusive
    credited = []
    hits = []
    
    # Count up the exact matches of a number being in the correct spot, represented by !
    bang = 0  
    for i in 0..3
      bang += 1 if code[i] == attempt[i]
    end
    
    # After the bangs, count the stars - this one is a bit trickier to implement
    star = 0
    for i in 0..3
      for j in 0..3
        # Check each digit of Breaker's attempt against every digit in the code
        if attempt[i] == code[j]
          instances_attempt = attempt.count(attempt[i]) # Count up instances in Breaker's code
          instances_code = code.count(attempt[i]) # Count up instances in the Maker's code
          # Use the lesser of the two - can't count more than we actually have!
          if instances_attempt > instances_code
            max_instances = instances_code
          else
            max_instances = instances_attempt; end
          # As long as this digit hasn't already been 
          if !credited.include?(attempt[i])
            max_instances.times do
              star +=1; end
            credited << attempt[i]; end
        end
      end
    end
    
    # All bangs will also register as stars, so we remove them from the star count
    star -= bang
    blank = 4

    # Add bangs to result
    if bang > 0
      for k in 1..bang
        hits << "!"
        blank -= 1; end
    end

    # Add stars to result
    if star > 0
      for p in 1..star
        hits << "*"
        blank -= 1; end
    end

    blank.times do
      hits << " "; end

    return hits
  end

  # Store history of code-breaker guesses
  def store_attempt(turn, attempt)
    @attempts[turn] = attempt 
  end
  # Store history of hits (bangs & stars)
  def store_hits(turn, hits)
    @hits[turn] = hits
  end

  def attempts
    return @attempts
  end

  def hits
    return @hits
  end

end