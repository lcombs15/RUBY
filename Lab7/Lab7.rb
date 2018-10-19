#!/usr/bin/ruby
# CIT 383
# Lab 4
# Combs, Lucas

# determine number of datum
datumCount = 0
while (datumCount <= 0) do
	print "Enter total set of numbers > 0: "
	datumCount = gets().to_i()
end;

# Init data array with zeros
data  = Array.new(datumCount, 0)

grandTotal = 0

# Populate data array with user input
for datum in 0..data.length()-1 do
	print "Enter datum #{datum+1} of #{datumCount}: "
	data[datum] = gets.to_i()
	grandTotal += data[datum]
end; 

# Print report header
puts 	"Line #\tValue\tRunning Sum\n"\
		"-----\t------\t------------"	

# Print report lines and make calculations
runningSum = 0
stdDev = 0
average = grandTotal / datumCount.to_f()
line = 0
data.each do |item|
	runningSum += item
	stdDev += (item - average)**2
	line += 1
	puts "#{line}\t#{item}\t#{runningSum}"
end

puts "\nTotal Numer of Items: #{datumCount}"
puts "Grand Total: #{grandTotal}"

puts "\nAverage: #{average}"

stdDev =  Math.sqrt(stdDev / (data.length()-1))
print "\nStandard Deviation: #{stdDev}"