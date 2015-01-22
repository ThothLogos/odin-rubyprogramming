# odin-rubyscripts
The Odin Project - Ruby: Basic Problems - http://www.theodinproject.com/ruby-programming/building-blocks

01 - Caesar Cipher

  A caesar cipher is an elementary encryption technique of shifting each character forward or backword by a particular key value. This problem required:
  
    - Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string
    - Don't forget to wrap from z to a
    - Don't forget to keep the same case

02 - Stock Picker

  A simple program to identify the best single trading opportunity between a set of prices, and report the correct days for the opportunity to the user, the problem required:
  
    - Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell

03 - Substrings

  A simple program to count the occurances of dictionary words in a given input. The problem required:
  
    - Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found
    - Make sure your method can handle multiple words

Advanced Problems - http://www.theodinproject.com/ruby-programming/advanced-building-blocks

04 - Bubble Sort

  The classic bubble sort, implemented in Ruby.
  
    - Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology
    - Now create a similar method called #bubble_sort_by which sorts an array but accepts a block. The block should take two arguments which represent the two elements currently being compared. Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right. 0 means they are equal. A positive result means the left element is greater. Use this to sort your array.

05 - Enumerable Methods

  A simple task to build several of the built-in sorting methods by hand, to explore enumerator functionality.
  
    - Add your new methods onto the existing Enumerable module.
    - Create #my_each, a method that is identical to #each but (obviously) does not use #each. You'll need to remember the yield statement. Make sure it returns the same thing as #each as well.
    - Create #my_each_with_index in the same way.
    - Create #my_select in the same way, though you may use #my_each in your definition
    - Create #my_all? #my_any? #my_none? #my_count #my_map #my_inject
    - Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject
    - Modify your #my_map method to take a proc instead.
    - Modify your #my_map method to take either a proc or a block, executing the block only if both are supplied (in which case it would execute both the block AND the proc).
