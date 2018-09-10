#!/usr/bin/ruby
# CIT 383
# Lab 3
# Combs, Lucas

# Initialize Variables
sum = 0
count = 0
odd = 0

# Prompt user for input
print("Enter an integer value (0 to quit): ")
value = gets().to_i()

while (value != 0) do
	# Record totals
	sum += value;
	count += 1;

	# Count number of odd values
	if (value % 2 == 1) then
		odd += 1
	end;
	
	# Prompt user again
	print("Enter next value: ")
	value = gets().to_i()
end

# Display Summary
puts("# of values: #{count}")
puts("The sum of the entered values is: #{sum}")