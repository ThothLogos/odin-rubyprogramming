# The Odin Porject - Section 3: Ruby Programming
# Project File - Computer Science: No. 1, Recursion - Merge Sort

# Implementation of recursive merge sorting. There are 3 basic steps: divide
# into smaller sets, recursively sort the smaller sets (dividing again), then
# recombine using a merge comparison.

def merge_sort(nums)
  # Base case, if the recursion is being done on a single element, no sorting can be
  # done and we can begin collapsing the recursion branch
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

array = [2, 8, 9, 1, 4, 0, 10, 100, 53, 12]

print merge_sort(array)
