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