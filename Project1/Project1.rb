#!/usr/bin/ruby
# CIT 383
# Project 1
# Combs, Lucas

puts "Welcome to Cash Register $$$"

menu = 	"(1) Add Item Charge\n"\
		"(2) Add Labor Charge\n"\
		"(3) Apply Discount\n"\
		"(4) Apply Gift Card\n"\
		"(5) Total\n"\
		"(9) New Trnasaction\n"\
		"(0) Exit Application\n"\
		"  Selection: "

# Prompt user for input
print menu
input = gets().to_i()

while !(input == 0) do
	print menu
	input = gets().to_i()
end

