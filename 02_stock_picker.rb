# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 2 Stock Picker


# My stratey was simple. Since you must buy before you can sell,
# I decided to use a nested for loop to compare every value with all of the
# values that come after it, check the profit margins, and keep track of
# the indices of those positions if they're relevant.

$best_days = [0, 0]
$best_profit = 0

def stock_picker(price_set)

	# Split the incoming string into an array
	prices = price_set.split(" ")

	# Step through the array of prices
	for i in 0..(prices.length - 1) do # The last index will never a "buy" day
		for j in (i+1)..prices.length do # Step through every successive element from i
			
			# Grab the values and convert to integers
			first = prices[i].to_i
			second = prices[j].to_i

			# Find profit potential
			profit = second - first

			# Compare to previous profit findings, replace if better
			if profit > $best_profit
				$best_profit = profit
				$best_days[0] = i #
				$best_days[1] = j; end; end; end
end

# Testing

puts "Enter a series of integer prices, separated by spaces: "
input = gets.chomp

stock_picker(input)

puts "The best profit was: " + $best_profit.to_s
puts "The best day to buy was day number " + ($best_days[0]+1).to_s +
	 " and then sell on day number " + ($best_days[1]+1).to_s