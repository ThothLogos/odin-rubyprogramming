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
      return true if @attempts[i] == break_attempt
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
    
    instances_attempt = 0
    instances_code = 0
    max_instances = 0
    credited = []

    bang = 0  
    for i in 0..3
      bang += 1 if code[i] == attempt[i]; end

    star = 0
    for i in 0..3
      for j in 0..3
        if attempt[i] == code[j]
          # Maximum number of hits possible constrained by actual duplicates
          instances_attempt = attempt.count(attempt[i])
          instances_code = code.count(attempt[i])
          instances_attempt > instances_code ? max_instances = instances_code : max_instances = instances_attempt
          if !credited.include?(attempt[i])
            max_instances.times do
              star +=1; end
            credited << attempt[i]; end
        end
      end
    end

    star -= bang
    
    i = 0
    if bang > 0
      for k in 1..bang
        hits[i] = "!"
        i += 1; end
    end

    if star > 0
      for p in 1..star
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