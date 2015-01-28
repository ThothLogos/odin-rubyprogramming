class GameData


  def initialize
    @attempts = Hash.new
  end

   

  # Store history of code-breaker guesses, integers as an index storying 4-integer arrays
  def store_attempt(code)
    @attempts[@attempts.length + 1] = code 
  end

  def getattempts
    return @attempts
  end



end