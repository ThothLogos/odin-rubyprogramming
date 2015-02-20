# The Odin Project - Section 3: Ruby Programming
# Computer Science: Recursion No. 1, Fibonacci


# Implementation using iteration, prints the set of fibonacci numbers
# up to the quantity passed into the function
def fibs(n)
  fibs = [] # Array to hold our sequence
  i = 0; j = 1 # First two fibs
  fibs << i; fibs << j
  (n-1).times do
    newfib = i + j
    fibs << newfib # Add each fib to the result set
    i = j
    j = newfib
  end
  return fibs
end

# Implementation using recursion
def fibs_rec(n, fibs = [0,1])
  # Escape when countdown is at the bottom range
  if n < 2
    return fibs
  else
    # If not, add the new fib, recall self with n-1
    fibs_rec(n-1, fibs << fibs[-1] + fibs[-2])
  end
end

print fibs(12)
print fibs_rec(12)
