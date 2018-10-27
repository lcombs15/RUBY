#!/usr/bin/ruby
# CIT 383
# Lab 8
# Combs, Lucas

# Force the user to enter an integer [min, max]
def getDataSize(min, max)
	print "Enter a number between #{min} and #{max}: "
	retVal = gets().to_i();
	
	if retVal < min || retVal > max then
		puts "Invalid entry. Number must be between #{min} and #{max}. You entered #{retVal}."
		return getDataSize(min, max)
	end
	
	return retVal
end

# Returns an array of given size containing random ints: [0, 1000]
def createArray(arraySize)
	retVal = Array.new(arraySize)
	for i in 0...arraySize
		retVal[i] = rand(1..1000)
	end
	return retVal
end

# Write number array to file
def writeFile(numArray, fileName)
	file = File.new(fileName, 'w')
	numArray.each do |num|
		file.puts(num)
	end
	file.close()
end

# Generate number array from numbers in a file
def readFile(fileName)
	file = File.new(fileName, 'r')
	retVal = Array.new()
	file.each_line do |num|
		retVal.push(num.to_i())
	end
	file.close()
	return retVal
end

# Print all elements that don't match between A and B
def compare(a, b)
	index = 0;
	while (index < a.length() || index < b.length()) do
		if a[index] != b[index]
			puts "Elements at position #{index + 1} are different. Source: #{a[index]}. Target: #{b[index]}"
		end
		index += 1
	end
end

# Print array to console
def printArray(array)
	print "["
	for i in 0...array.length()
		print array[i]
		if i != array.length() -1
			print ", "
		end
	end
	print "]\n"
end

size = getDataSize(1, 20)
gen_nums = createArray(size)

PATH = "Output.txt"
writeFile(gen_nums, PATH)
read_nums = readFile(PATH)
compare(gen_nums, read_nums)

puts

print "Source Data: \t"
printArray(gen_nums)

print "File Data: \t"
printArray(read_nums)