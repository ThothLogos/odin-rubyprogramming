# The Odin Porject - Section 3: Ruby Programming
# Project OOP With Ruby, No. 1 Tic Tac Toe
#
# NOTE: Heavy use of comments intended for fellow students of The Odin
# Project who may be seeking insight into another's thought process.

class Mastermind

    def generate_code
      code = []
      4.times do
          code << 1 + rand(6)
      end
      return code
    end

end
