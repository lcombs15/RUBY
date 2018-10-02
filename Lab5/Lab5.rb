#!/usr/bin/ruby -w
# CIT 383
# Lab 5
# Combs, Lucas

# Constants
DATA_SET_SIZE = 10000

# Create Hash
	print "Enter min value: "
		min = gets().to_i()
	print "Enter max value (must be greater than #{min}): "
		max = gets().to_i()

	if (max <= min) then
		puts "Max must be greater than min."
		return
	end;

	hash = Hash.new(0)

# Populate Hash
	x = 1;
	while (x <= DATA_SET_SIZE) do
		rand_val = rand(min..max)
		hash[rand_val] = hash[rand_val] + 1
		x += 1
	end;


# Aggregate and print out data
	puts	"\nLine #\t\tKey\tCount\n"\
			"------\t\t-----\t------"
		
	evenCount = 0
	evenSum = 0
	oddCount = 0
	oddSum = 0
	keynum = 1
	hash.each do |key, value|
		puts "#{keynum}\t\t#{key}\t#{value}"
		keynum += 1
		if (key % 2 == 0) then
			evenCount += 1
			evenSum += value
		else
			oddCount += 1
			oddSum += value
		end;
	end;
	
	puts	"\nEven/Odd\tCount\tSum\n"\
			"------\t\t-----\t------\n"\
			"Even\t\t#{evenCount}\t#{evenSum}\n"\
			"Odd\t\t#{oddCount}\t#{oddSum}\n\n"\
	
	puts "Total number of occurrences: #{evenSum + oddSum}"
		
