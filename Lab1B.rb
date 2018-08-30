#!/usr/bin/ruby
# CIT 383
# Lab 1B, section 2
# Combs, Lucas

# Get data from user
print("Enter name of the client: ")
clientName = gets().chomp() # remove new line

print("Enter name of the project: ")
projectName = gets().chomp() # remove new line

print("Total cost of project: ")
totalCost= gets().to_i() # remove new line

print("Width of building base: ")
width = gets().to_i() # convert to integer

print("Length of building base: ")
length = gets().to_i() # convert to integer

print("Number of floors: ")
numFloors = gets().to_i() # convert to integer


# Calculate the cost per square foot of floor space
costPerSquareFoot = totalCost.to_f() / (numFloors * length * width)

# Round "Cost Per SQuare Foot" to 2 decimal places
tmp = costPerSquareFoot * 100
tmp = tmp.to_i()
costPerSquareFoot = tmp / 100.0

# Output using string concatenation
print "\nThe '" + projectName + "' project, for " + clientName
print ", had a total cost of $" + totalCost.to_s()
print " with a cost of $" + costPerSquareFoot.to_s()
print " per square foot.\n\n\n"

# Output using string substitution
puts("Width\t\tLength\t\tFloors")
puts("-------\t\t-------\t\t-------")
puts("#{width}\t\t#{length}\t\t#{numFloors}")

