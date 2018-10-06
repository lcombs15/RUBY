#!/usr/bin/ruby
# CIT 383
# Project 2
# Combs, Lucas

# Constants
NUM_EVENTS = 3
EVENT_MIN = [30, 90, 120]
EVENT_MAX = [89, 119, 360]

# Get Data from user
print "Enter the number of athletes: "
num_athletes = gets().to_i()

# Validate data from user
if num_athletes <= 0
	puts "Valid entry is any number greater than zero. You Entered: #{num_athletes}"
	return
end

# Initialize dataset with default = 0
time_data = Array.new(num_athletes) { Array.new(NUM_EVENTS, 0) }

for athlete in time_data
	for event in 0...athlete.length
		print athlete[event] = rand(EVENT_MIN[event].to_i..EVENT_MAX[event].to_i)
		print "\t"
	end
	puts
end