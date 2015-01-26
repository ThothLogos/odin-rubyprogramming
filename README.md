# The Odin Project - Ruby Programming

<h4>Basic Problems - http://www.theodinproject.com/ruby-programming/building-blocks</h4>

<h5>01 - Caesar Cipher</h5>

  A caesar cipher is an elementary encryption technique of shifting each character forward or backword by a particular amount.
  <ul>
  <li>Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string</li>
  <li>Don't forget to wrap from z to a</li>
  <li>Don't forget to keep the same case</li>
  </ul>
  
<h5>02 - Stock Picker</h5>

  A simple program to identify the best single trading opportunity between a set of daily market prices, and report the correct days for the opportunity to the user.
  <ul>
  <li>Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell</li>
  </ul>

<h5>03 - Substrings</h5>

  Provided a dictionary of words to check for, the task was to search a user's input string for instances of each word in the dictionary and report this data to the user.
  <ul>
  <li>Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found</li>
  <li>Make sure your method can handle multiple words</li>
  </ul>

<h4>Advanced Problems - http://www.theodinproject.com/ruby-programming/advanced-building-blocks</h4>

<h5>04 - Bubble Sort</h5>

  The classic bubble sort. Iterations through the supplied set of numbers continue, comparing each element to each successive elements, and swapping positions if the first is greater than the second. With each pass, the largest values "bubble" to one side, eventually sorting the entire set.
  <ul>
  <li>Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology</li>
  <li>Create a similar method called #bubble_sort_by which sorts an array but accepts a block. The block should take two arguments which represent the two elements currently being compared. Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right. 0 means they are equal. A positive result means the left element is greater. Use this to sort your array</li>
  </ul>

<h5>05 - Enumerable Methods</h5>

  A task to build many of the built-in sorting methods by hand, to explore enumerable type functionality.
  <ul>
  <li>Add your new methods onto the existing Enumerable module</li>
  <li>Create #my_each, a method that is identical to #each but (obviously) does not use #each. You'll need to remember the yield statement. Make sure it returns the same thing as #each as well</li>
  <li>Create #my_each_with_index in the same way</li>
  <li>Create #my_select in the same way, though you may use #my_each in your definition</li>
  <li>Create #my_all? #my_any? #my_none? #my_count #my_map #my_inject</li>
  <li>Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject</li>
  <li>Modify your #my_map method to take a proc instead</li>
  <li>Modify your #my_map method to take either a proc or a block, executing the block only if both are supplied (in which case it would execute both the block AND the proc)</li>
  </ul>
  
  <h4>OOP With Ruby - http://www.theodinproject.com/ruby-programming/oop</h4>
  
<h5>Tic Tac Toe</h5>
  
  Build a console version of the classic game tic-tac-toe using Ruby and Class/Object-Oriented design. My solution can be previewed at: http://goo.gl/Mq2DOz
