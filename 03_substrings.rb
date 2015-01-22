# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 3 Substrings

def substrings(phrase, dictionary)

	result = []
	chars = []

	words = phrase.split(" ")
	words.each do |word|
		chars << word.split("")
	end

	puts print words
	puts print chars

end

dictionary = ["below","down","go","going","horn","how","howdy",
				"it","i","low","own","part","partner","sit"]
#result = substrings("below", dictionary)
puts "Enter some words, a phrase, anything: "
input = gets.chomp

substrings(input, dictionary)