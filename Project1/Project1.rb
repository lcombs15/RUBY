#!/usr/bin/ruby
# CIT 383
# Project 1
# Combs, Lucas

puts "Welcome to Cash Register $$$"

 def transactionMenuPrompt()
	# Prompt user for input
 	print "(1) Add Item Charge\n"\
		"(2) Add Labor Charge\n"\
		"(3) Apply Discount\n"\
		"(4) Apply Gift Card\n"\
		"(5) Total\n"\
		"(9) New Transaction\n"\
		"(0) Exit Application\n"\
		"  Selection: "
	# Get input from user
	return gets().to_i()
end

while ((input = transactionMenuPrompt()) != 0) do
	puts "Got: #{input}"
end

