# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 5 Enumerable Methods

module Enumerable
   
   # Iterates through each element inside of a collection and forwards each
   # element's value to an optional block
   def my_each

      if block_given?
         for i in self # Iterate each element
            yield(i); end # Yield to the block
      else
         return self.to_enum; end # If no block, return enum
   end

   # Forwards each element's index, rather than value, to the block
   def my_each_index

      if block_given?
         for i in self
            yield(self.index(i)); end
      else
         return self.to_enum; end
   end


   # Returns new array containing all elements that return true from the block
   def my_select

      result = []

      if block_given?
         for i in self
            if yield(i) == true      # Anything returning true from the block
               result << i; end; end # is placed in a new array
         return result
      else
         return self.to_enum; end 
   end


   # Returns true if the block never returns false or nil. If no block is given
   # an implicit block is added which will return true. The implicit block checks
   # to see if each element is an object, which it will always be
   def my_all?(&block)

      truthiness = true # Assume all will match

      if !block_given?
         block ||= Proc.new { |obj| obj }; end # Implicit block
      for i in self
         # One bad apple spoils the bunch, return false unless everything is true
         truthiness = false if block.call(i) == false || block.call(i) == nil; end
      return truthiness
   end


   # Returns true if the block ever returns anything besides false or nil. As with
   # my_all?, the implicit block is added when non is provided, which will result
   # in a true return
   def my_any?(&block)

      truthiness = false # Assume nothing will match

      if !block_given?
         block ||= Proc.new { |obj| obj }; end
      for i in self
         # If any single element is valid, return true
         truthiness = true if block.call(i) != false && block.call(i) != nil; end
      return truthiness
   end


   # Returns false if the block ever returns a single true. If no block is given, it checks
   # each element of the calling collection instead and, like with a block, returns false 
   # if a true is ever found
   def my_none?

      truthiness = true # Assume we won't hit any matches

      for i in self
         if block_given? # If we have a block, yield
            truthiness = false if yield(i) == true
         else # If no block, check the caller's elements instead
            truthiness = false if i == true; end; end
      return truthiness
   end


   # With no arguments passed, returns the number of items in the collection. If an
   # argument is included, it will count the instances in the collection equal to the
   # item passed in. If a block is provided, it will count the number of true returns
   # from the block
   def my_count(item = nil)

      count = 0

      for i in self
         if block_given? # Count trues inside the block
            count += 1 if yield(i) == true
         elsif item != nil # Count items matching input
            count += 1 if i == item       
         else # No block, no arg, count self
            count += 1; end; end
      return count
   end


   # Returns a new array with the results of running a block once for every element
   # inside the calling collection. If no block is provided, an enum is returned
   def my_map

      result = []

      if block_given?
         for i in self
            result << yield(i); end
         return result
      else
         return self.to_enum; end
   end


   # 
   def my_inject


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

#words.my_all? { |word| word.length >= 3 }
#words.my_all? { |word| word.length >= 4 }
#words.my_all?

#words.my_any? { |word| word.length >= 3 }
#words.my_any? { |word| word.length >= 5 }
#[nil, true, 99].my_any?

#array.my_count
#array.my_count(3)
#array.my_count { |x|  x % 2 == 0 }

array.map { |x| x ** x }
array.my_map { |x| x ** x }