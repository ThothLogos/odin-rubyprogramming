# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 4 Bubble Sort


# The classic bubble sort algorithm. A simple while loop controlled by a flag
# that tracks if any sorting is completed. Each iteration of the while loop will
# trigger a full pass for loop through the array start to finish, comparing adjacent
# values, and swapping them if the bigger one comes first. In this way, the largest 
# values slowly "bubble" to the end of the array, and the end result is sorted. A
# slow, but simple implementation of basic sorting.

def bubble_sort(array)

   unsorted = true # All incoming data defaults to unsorted

   # Keep going until sorted
   while unsorted == true 
      unsorted = false # Each pass assume this will be the last
      for i in 0...(array.length - 1)
         if array[i] > array[i+1] # Compare
            array[i], array[i+1] = array[i+1], array[i] # Swap if bigger
            unsorted = true; end; end; end # Work was done, set flag for continuation
   
   puts array
end


# Alternate version that takes a block as a parameter and will allow you to modify
# the sorting technique. The call to yield with two parameters maps to the block 
# definition which works with two parameters.

def bubble_sort_by(array)

   unsorted = true

   while unsorted == true 
      unsorted = false
      for i in 0...(array.length - 1)
         if yield(array[i], array[i+1]) > 0 # Compare using block input
            array[i], array[i+1] = array[i+1], array[i]
            unsorted = true; end; end; end

   puts array
end


# Testing bubble_sort
bubble_sort([-3, 22, 1, 99, -45, 18, 4, 2, 8, 53])

# Testing bubble_sort_by with same behavior as bubble_sort
bubble_sort_by([-3, 22, 1, 99, -45, 18, 4, 2, 8, 53]) { |first, second| first - second }

# Slight modification to the block input allows bubble_sort_by to do descending order
bubble_sort_by([-3, 22, 1, 99, -45, 18, 4, 2, 8, 53]) { |first, second| second - first }