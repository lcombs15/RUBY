#!/usr/bin/ruby -w
# CIT 383
# Lab 6
# Combs, Lucas

# Get Data from user
print "Enter the number of seconds to sleep: "
sleep_seconds = gets().to_i()

# Validate data from user
if sleep_seconds <= 0
	puts "Valid entry is any number greater than zero. You Entered #{sleep_seconds}"
	return
end

# Randomly generate # sleep cycles [2, 5]
sleep_cycles = rand(2..5)

puts "\nNumber of iterations that will occur: #{sleep_cycles}"

# Estimate time elapsed
estimated_time = sleep_cycles * sleep_seconds

puts "Estimated total number of sleep seconds: #{estimated_time}\n\n"

start_time = Time.now() # Save current time

# Sleep loop
sleep_cycles.times do
	sleep(sleep_seconds)
end

end_time = Time.now() # Save current time

# calculate the elapsed time in seconds
elapsed_seconds = (end_time - start_time).to_i()

# Print start & end times
puts "Start Time: #{start_time}"
puts "Start Time: #{end_time}\n\n"

# Print final report
puts "Actual total number of sleep seconds: #{elapsed_seconds}"
puts estimated_time == elapsed_seconds ? "Success! Sleep function works as it should!" : "ERROR: estimated time was not correct"