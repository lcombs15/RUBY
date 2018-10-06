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

# Initialize time dataset with default = 0
time_data = Array.new(num_athletes) { Array.new(NUM_EVENTS, 0) }

# Initialize time total datasets with default
athlete_sum_data = Array.new(num_athletes, 0)
event_sum_data = Array.new(NUM_EVENTS, 0)

# Print report header
puts	"\nTri-Athalon Time Results\n"\
		"Athlete #\tSwim\t\t\tRun\t\t\tBike\t\t\tTotal Time\n"\
		"---------\t----\t\t\t----\t\t\t----\t\t\t-----------\n"


# Loop through all athletes
for athlete_num in 0...time_data.length
	# Store reference to current athlete
	athlete_times = time_data[athlete_num]
	
	print "#{athlete_num + 1}\t\t"
	
	# Loop through events for given athlete
	for event_id in 0...athlete_times.length
		# Store randomly generated time within bounds
		time = rand(EVENT_MIN[event_id].to_i..EVENT_MAX[event_id].to_i)
		
		# Record generated time for athlete
		athlete_times[event_id] = time
		
		# Add time to athletes total
		athlete_sum_data[athlete_num] += time
		
		# Add time to event total
		event_sum_data[event_id] += time
		
		# Print out time
		print "#{time / 60}:#{time % 60} (#{time})\t\t"
	end
	
	# Print out athlete total
	total = athlete_sum_data[athlete_num]
	print "#{total / 60}:#{total % 60} (#{total})\n"
end

# Display totals
print "\nAvg times:\t"
grand_total = 0

# Loop through events
for event in event_sum_data
	# Keep track of total
	grand_total += event
	
	# Calculare and display event average
	avg = event / num_athletes
	print "#{avg / 60}:#{avg % 60} (#{avg})\t\t"
end

# Display grand total for time
print "#{grand_total / 60}:#{grand_total % 60} (#{grand_total})"