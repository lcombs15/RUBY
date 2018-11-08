#!/usr/bin/ruby
# CIT 383
# Lab 10
# Combs, Lucas

# Import date
require 'date'

# Get a valid year from the user
def getMonth()
	print "Enter a month (1 = Jan): "
	retVal = gets().to_i()
	
	if (1..12).include?(retVal) then
		return retVal;
	else
		puts "Invalid. Month must be between 1 and 12. Got: #{retVal}"
		return getYear()
	end
end

# Get a valid year from the user
def getYear()
	print "Enter a year: "
	retVal = gets().to_i()
	
	if (0..9999).include?(retVal) then
		return retVal;
	else
		puts "Invalid. Year must be between 0 and 9999. Got: #{retVal}"
		return getYear()
	end
end

# Print calendar for given month to console
def printMonth()
	year = getYear()
	month = getMonth()
	date = Date.new(year, month, 1)
	
	puts "\nCalendar for: #{date.strftime("%B, %Y")}"
	
	puts "\nSun\tMon\tTue\tWed\tThu\tFri\tSat"
	
	# Leading days from previous month
	date.cwday.times{ print "\t" }
		
	lastDay = date.next_month().prev_day()
			
	while ((date <=> lastDay) < 1) do
		if date.cwday == 7 && date.mday != 1 then
			puts "\n"
		end
		
		print "#{date.mday}\t"
			
		date = date.next_day()
	end
end

printMonth()