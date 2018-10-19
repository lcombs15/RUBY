#!/usr/bin/ruby
# CIT 383
# Lab 7 (Lab 4 revision)
# Combs, Lucas

def populateArray(arraySize)
	# Init data array with zeros
	retVal  = Array.new(arraySize, 0)

	# Populate data array with user input
	for datum in 0..retVal.length()-1 do
		print "Enter datum #{datum+1} of #{arraySize}: "
		retVal[datum] = gets.to_i()
	end; 
	
	return retVal
end

def calcTotal(numArray)
	retVal = 0
	for num in numArray do
		retVal += num
	end
	return retVal
end

def calcAvg(numArray)
	return calcTotal(numArray) / numArray.length().to_f()
end

def calcStandardDeviation(numArray)
	if numArray.length() == 0 then
		return 0
	end
	runningSum = 0
	stdDev = 0
	average = calcTotal(numArray) / numArray.length().to_f()
	numArray.each do |item|
		runningSum += item
		stdDev += (item - average)**2
	end
	
	return Math.sqrt(stdDev / (numArray.length()-1))
end

def displayResults(numArray, total, avg, stdDev)
	# Print report header
	puts 	"Line #\tValue\tRunning Sum\n"\
			"-----\t------\t------------"	

	# Print report lines and make calculations
	runningSum = 0
	for i in 0...numArray.length
		item = numArray[i]
		runningSum += item
		puts "#{i + 1}\t#{item}\t#{runningSum}"
	end

	puts "\nTotal Number of Items: #{numArray.count}"
	puts "Grand Total: #{calcTotal(numArray)}"
	puts "\nAverage: #{calcAvg(numArray).round(2)}"
	print "\nStandard Deviation: #{calcStandardDeviation(numArray).round(4)}"
end

# determine number of datum
	print "Enter total set of numbers > 0: "
	datumCount = gets().to_i()
	if datumCount > 0 then
		data = populateArray(datumCount)
	
		displayResults(data, 
			calcTotal(data),
			calcAvg(data),
			calcStandardDeviation(data))
	else
		puts "Array size cannot be less than 0. You entered: #{datumCount}"
	end