# The Odin Project - Section 3: Ruby Programming
# Intermediate Ruby: OOP With Ruby, No. 2 Mastermind

class MastermindAI

  def initialize
    @simple_definites = []
    @simple_possibles = []    
  end

  def generate_code
    code = []
    4.times do
        code << (1 + rand(6)).to_s
    end
    return code
  end


  def simple_algo(data)
    num = 1 + rand(6)
    4.times do
      first_attempt << num
    end

    
    puts num.to_s
    sleep 2
  end

  def knuth_algo
  end
  
end