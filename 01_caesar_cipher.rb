# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 1 Caesar Cipher


# First attempt, primary thought was convert to ASCII values shift the
# number around, and cast back to a string. Things got sloppy quick with
# the upcoming juggling needed to check for A->Z, Z->A wrapping, and I
# resigned to the thought that there must be a better way.

def caesar_cipher(message, offset)
	
	chars	= 	[]
	nums 	= 	[]
	
	if offset > -1
		offset = offset % 26
	else
		offset = -offset % 26
		offset = -offset; end

	words = message.split(" ") #Make an array of words from the input, strip spaces
	words.each do |word| #From each word....
		chars.push(word.split("")); end #Construct a sub-array of its characters
	
	chars.each do |char| #On each character....
		nums.push(char.map(&:ord)); end #Send the ASCII integer value to a new array

	for i in 0...nums.length do #Step through each word
		for j in 0...nums[i].length do #And each character
			nums[i][j] += offset #Alter the ASCII value by the offset
			nums[i][j] = nums[i][j].chr; end; end #Translate back, ASCII->String

	return nums
end


# Second go at it, using more tools available to strings to cut down
# on worrying about ASCII values and arrays. The .next method for strings
# allowed an easy way to increment characters directly, while the ASCII
# trick still was necessary for decrementing. A bit of RegEx to only work
# on alphabetic characters leaves puncuation and spacing out of the picture
# entirely.

def caesar_cipher2(message, offset)

	offset %= 26
	cipher = ''

	# Direction is relevant for checking A->Z, Z->A wrapping
	increment = true if offset > 0

	if increment
		message.each_char do |c|
			offset.times do
				if c.match(/[A-Ya-y]/)
					c.next! #No wrap required on these letters, increment
				else
					if c.match(/Z/) #Wrap required
						c = 'A'; end
					if c.match(/z/)
						c = 'a'; end; end; end
			cipher << c #Insert scrambled character to output string
		end
	else #decrement
		message.each_char do |c|
			offset.abs.times do #Use absolute value, can't do a loop negative times!
				if c.match(/[B-Zb-z]/)
					c = (c.ord - 1).chr #Quick shuffling using ASCII value
				else
					if c.match(/A/) #Reverse wrap required
						c = 'Z'; end
					if c.match(/a/) 
						c = 'z'; end; end; end
			cipher << c #Insert scrambled character to output string
		end
	end

	return cipher
end

# Testing

puts "Enter a string to cypher:"
input = gets.chomp
puts "Offset depth?"
depth = gets.chomp.to_i

print caesar_cipher2(input, depth)