# The Odin Project - Section 3: Ruby Programming
# Computer Science: Recursion No. 2, Merge Sort

# Implementation of recursive merge sorting. There are 3 basic steps: divide
# into smaller sets, recursively sort the smaller sets (dividing again), then
# recombine using a merge comparison.

def merge_sort(nums)
  # Base case, no sorting to do on a single element, collapses recursion branch
  return nums if nums.length <= 1
  # Divide
  a = nums[0..(nums.length/2)-1]
  b = nums[(nums.length/2)..-1]
  # Conquer
  result = merge(merge_sort(a), merge_sort(b))
end

# Compares two incoming arrays, returns a single sorted array
def merge(a, b)
  merged = []
  until a.empty? || b.empty?
    # Grab the smaller of the two, move it into the result
    if a.first <= b.first
      merged << a.shift # Pops first element out of 
    else
      merged << b.shift
    end
  end
  # Append final remaining element
  merged += a += b
end


# Size of test array to sort
size = 100

full_set = []
# Fill up a set to randomly sample unique values from
for i in 0..size
  full_set << i
end

big_array = []
size.times do
  # We select a random element remaining, return it, and remove it from the source
  big_array << full_set.delete_at(rand(full_set.length))
end

# Show the scrambled array
print big_array.to_s + "\n"

# Sorted
print merge_sort(big_array)