#!/usr/bin/ruby
# CIT 383
# Lab 3
# Combs, Lucas

# Prompt user for input
print("Enter an integer value between 1 and 5: ")
value = gets().to_i()

# Validate input
if (value < 1 || value > 5) then
	puts "Invalid input: '#{value}'. Must be between 1 and 5."
	return;
end;

# Print header
puts "n\tn^2\tn^3\tn^4"

for n in 1...value+1 do
	puts "#{n}\t#{n**2}\t#{n**3}\t#{n**4}"
end;

