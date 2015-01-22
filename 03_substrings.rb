# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 3 Substrings


# A relatively simple and elegent solution comes together with a bit of
# simple RegEx. This may not be the fastest implementation, but the strategy
# is simple - check everything, count it up.

def substrings(phrase, dictionary)

	# Iterate through each possible word we want to count
	dictionary.each do |entry|
		# Scan the entire incoming text for each entry, count the occurances
		hits = phrase.scan(/#{entry}/).count
		# Don't print anything if the entry didn't hit
		unless hits == 0 then puts "Entry: " + entry + "\t" + hits.to_s; end
	end
end

dictionary = ["below","down","go","going","horn","how","howdy",
				"it","i","low","own","part","partner","sit"]
#result = substrings("below", dictionary)
puts "Enter some words, a phrase, anything: "
input = gets.chomp

substrings(input, dictionary)