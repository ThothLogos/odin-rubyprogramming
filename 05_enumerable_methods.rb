# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 5 Enumerable Methods

module Enumerable
   

   def my_each

      if block_given?
         for i in self # Iterate each element
            yield(i); end # Yield to the block
      else
         return self.to_enum; end # If no block, return enum
   end


   def my_each_index

      if block_given?
         for i in self
            yield(self.index(i)); end # Send the index instead of the value
      else
         return self.to_enum; end
   end


   def my_select

      result = []

      if block_given?
         for i in self
            if yield(i) == true      # Anything returning as true
               result << i; end; end # is placed in a new array
         return result               # and returned to the user
      else
         return self.to_enum; end 
   end


   def my_all?(&block)

      truthiness = true

      if !block_given?
         block ||= Proc.new { |obj| obj }; end

      for i in self
         truthiness = false if block.call(i) == false || block.call(i) == nil; end

      return truthiness
   end


   def my_any?

      
      
   end


end


# Test cases
array = [6,3,4,11]

#array.each {|x| puts "Value: #{x}" }
#array.my_each {|x| puts "Value: #{x}" }

#array.each_index { |x| puts "Pos: #{x} "}
#array.my_each_index { |x| puts "Pos: #{x}"}

#array.select { |num| num.even? }
#array.my_select { |num| num.even? }

words = ["ant", "bear", "cat"]

words.all? { |word| word.length >= 3 }
words.all? { |word| word.length >= 4 }

words.my_all? { |word| word.length >= 3 }
words.my_all? { |word| word.length >= 4 }

words.my_all?