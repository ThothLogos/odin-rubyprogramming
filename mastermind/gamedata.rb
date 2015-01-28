class GameData


  def initialize

    @attempts = Hash.new
    @hits = Hash.new

    for i in 1..12
      @attempts[i] = [" ", " ", " ", " "]
      @hits[i] = "       "
    end

  end

   

  # Store history of code-breaker guesses, integers as an index storying 4-integer arrays
  def store_attempt(turn, code)
    @attempts[turn] = code 
  end

  def attempts
    return @attempts
  end

  def hits
    return @hits
  end


end