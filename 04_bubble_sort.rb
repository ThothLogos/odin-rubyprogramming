# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 4 Substrings


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
      unsorted = false # Each pass, assume this will be the last
      for i in 0...(array.length - 1)
         if array[i] > array[i+1] # Compare
            array[i], array[i+1] = array[i+1], array[i] # Swap if bigger
            unsorted = true; end; end; end # Work was done, set flag for continuation
   
   return array
end

print bubble_sort([-3, 22, 1, 99, -45, 18, 4, 2, 8, 53]).to_s