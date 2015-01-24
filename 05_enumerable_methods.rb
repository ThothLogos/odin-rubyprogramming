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

end


# Test cases
array = [6,3,4,11]

#array.each {|x| puts "Value: #{x}" }
#array.my_each {|x| puts "Value: #{x}" }

#array.each_index { |x| puts "Pos: #{x} "}
#array.my_each_index { |x| puts "Pos: #{x}"}

array.select { |num| num.even? }
array.my_select { |num| num.even? }