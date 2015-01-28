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

  def duplicate?(attempt)
    @attempts.each do |entry|
      return true if entry == attempt
    end
    return false
  end
   

  # Store history of code-breaker guesses, integers as an index storying 4-integer arrays
  def store_attempt(turn, attempt)
    @attempts[turn] = attempt 
  end

  def check_hits(code, attempt)

    hits = [" ", " ", " ", " "]
    
    return ["!", "!", "!", "!"] if code == attempt
     
    bang = 0  
    for i in 0..3
      bang += 1 if code[i] == attempt[i]; end

    star = 0
    for i in 0..3
      for j in 0..3
        if code[i] == attempt[j]
          star += 1 ; end
    end
    star -= bang
    
    i = 0
    if bang > 0
      for k in 0..bang
        hits[i] = "!"
        i += 1; end
    end

    if star > 0
      for p in 0..star
        hits[i] = "*"
        i += 1; end
    end

    return hits

  end

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