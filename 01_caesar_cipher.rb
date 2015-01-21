# The Odin Project - Section 3: Ruby Programming
# Project Building Blocks, No. 1 Caesar Cipher

def caesar_cipher(message, offset)
	
	chars	= 	[]
	nums 	= 	[]
	
	if offset > -1
		offset = offset % 26
	else
		offset = -offset % 26
		offset = -offset
	end

	words = message.split(" ")
	words.each do |word|
		chars.push(word.split(""))
	end
	
	chars.each do |char|
		nums.push(char.map(&:ord))
	end

	for i in 0...nums.length do
		for j in 0...nums[i].length do
			nums[i][j] += offset
			nums[i][j] = nums[i][j].chr
		end
	end

	return nums
end

puts "Enter a string to cypher:"
input = gets.chomp
puts "Offset depth?"
depth = gets.chomp.to_i

print caesar_cipher(input, depth)