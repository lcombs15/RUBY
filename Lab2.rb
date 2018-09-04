#!/usr/bin/ruby

# CIT 383
# Lab 2
# Combs, Lucas

# Constants
MINS_PER_HOUR = 60
HOURS_PER_DAY = 24
DAYS_PER_WEEK = 7
MINS_PER_WEEK = MINS_PER_HOUR * HOURS_PER_DAY * DAYS_PER_WEEK

# Get data from user
print "Enter the plan type (C-Commerical, R-Residential, S-Student): "
planType = gets().chomp().upcase()

print "Enter the number of talk minutes used: "
numTalkMinutes = gets().to_i()

# Validate data
dataValid = true # Assume data to be valid

# Check for valid number of talk minutes
if (numTalkMinutes < 0 || numTalkMinutes > MINS_PER_WEEK)
	dataValid = false;
	puts "Talk minutes n must be: 0 >= n <= #{MINS_PER_WEEK.to_s()}. You entered: '#{numTalkMinutes}'"
end;

if (case planType when "C","R","S" then false else true end)
	dataValid = false;
	puts "Valid plan types are: C-Commerical, R-Residential, S-Student. You entered: '#{planType}'."
end;

if (!dataValid)
	return
end;
