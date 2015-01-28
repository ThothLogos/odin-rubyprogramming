# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 2 Mastermind - by ThothLogos

class MastermindAI

    def generate_code
      code = []
      4.times do
          code << (1 + rand(6)).to_s
      end
      return code
    end
end