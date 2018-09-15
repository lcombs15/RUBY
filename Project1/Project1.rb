#!/usr/bin/ruby
# CIT 383
# Project 1
# Combs, Lucas

puts "Welcome to Cash Register $$$"

def init()
	$numCharges = 0
	$giftCardCount = 0
	$giftCardAmount = 0
	$discountPercentage = 0
	$totalPrice = 0
	$grandTotal = 0
end

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

def getTotal()
	return $totalPrice
end

init();

while ((input = transactionMenuPrompt()) != 0) do
	if (input == 9) then
		init()
	elsif (input == 5) then
		puts format("Total: $%0.2f" % getTotal())
	else
		# Every other menu option requires a number input
		print "\nAmount: "
		keyedAmount = gets().to_f()
		if (keyedAmount <= 0) then
			puts "Invalid input. Must be > 0."
		elsif (input == 4) then
			# Handle gift card
			$giftCardCount += 1
			$giftCardAmount += keyedAmount
		elsif (input == 3) then
			if(keyedAmount > 15 || keyedAmount % 5 != 0) then
				puts "Invalid discount: #{keyedAmount}%. Must be 5, 10, or 15."
			else
				# Apply discount if one hasn't already been given
				if ($discountPercentage != 0)
					puts "Discount has already been set: #{discount}%"
				else
					$discountPercentage = keyedAmount.to_i()
				end;
			end;
		elsif (input == 2) then
			# Add labor charge if one doesn't exisit
				if ($labor != 0)
					puts "Labor had already been charged: $#{labor}"
				else
					$labor = keyedAmount
				end;
		elsif (input == 1) then
			# Add item charge
			$totalPrice += keyedAmount
			$numCharges += 1
		end;
		
	end;
end

