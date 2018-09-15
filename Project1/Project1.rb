#!/usr/bin/ruby
# CIT 383
# Project 1
# Combs, Lucas

# Constants
TAX_PERCENTAGE = 0.065
APP_NAME = "Cash Register $$$"

# Initialize/reset all global variable
def init()
	$numCharges = 0
	$numGiftCards = 0
	$giftCardAmount = 0
	$discountPercentage = 0
	$total = 0
	$labor = 0
end

# Print menu options and return users selection
def transactionMenuPrompt()
	# Prompt user for input
 	print 	"(1) Add Item Charge\n"\
			"(2) Add Labor Charge\n"\
			"(3) Apply Discount\n"\
			"(4) Apply Gift Card\n"\
			"(5) Total\n"\
			"(9) New Transaction\n"\
			"(0) Exit Application\n"
		
	# Get single character input from user
	selection = ""
	loop do
		print "  Selection: "
		selection = gets().chomp()
		if (selection.length == 1)
			break
		end;
	end;
	
	selection = selection.to_i()
	if (selection > 5 && selection < 9) then
		puts "Invalid menu option.\n\n"
		return transactionMenuPrompt()
	end;
	
	return selection.to_i()
end

# Print formatted transaction total
def printTotal()
	discount = ($total * ($discountPercentage / 100.0)).round(2)
	tax = (TAX_PERCENTAGE * ($total - discount)).round(2)
	grandTotal = ($labor + $total + tax - discount).round(2)
	balance = (grandTotal - $giftCardAmount).abs().round(2)
	
	puts	"Receipt\n"\
			"Decription\tQuantity\tAmount\n"\
			"----------\t--------\t------\n"\
			"Items\t\t#{$numCharges}\t\t$#{format("%.2f" % $total)}\n"\
			"Discount\t#{$discountPercentage}%\t\t-$#{format("%.2f" % discount)}\n"\
			"Tax\t\t6.5%\t\t$#{format("%.2f" % tax)}\n"\
			"Labor\t\t#{$labor == 0 ? 0 : 1}\t\t$#{format("%.2f" % $labor)}\n"\
			"Grand Total:\t\t\t$#{format("%.2f" % grandTotal)}\n\n"\
			"Gift Cards\t#{$numGiftCards}\t\t-$#{format("%.2f" % $giftCardAmount)}\n\n\n"
			
			print ((grandTotal - $giftCardAmount) > 0)? "Please Pay Amount:" : "Remaining balance:"			
			print "\t\t$#{format("%.2f" % balance)}\n\n"
end

# Intialize all variables
init();

puts "Welcome to #{APP_NAME}"

# Loop until user enters 0 to exit
while ((input = transactionMenuPrompt()) != 0) do
	if (input == 9) then
		puts "Creating a new transaction"
		
		# Reset all variables for next transaction
		init()
	elsif (input == 5) then
		printTotal()
	else
		# The remaining menu options require a number from user
		
		# Get user input
		print "\nAmount: "
		keyedAmount = gets().to_f()
		
		if (keyedAmount <= 0) then
			puts "Invalid input. Must be > 0."
		elsif (input == 4) then
			# Accept gift card
			$numGiftCards += 1
			$giftCardAmount += keyedAmount
		elsif (input == 3) then
			# Discount must be whole number
			keyedAmount = keyedAmount.to_i()			
			
			# Validate discount
			if(keyedAmount > 15 || keyedAmount % 5 != 0) then
				puts "Invalid discount: #{keyedAmount}%. Must be 5, 10, or 15."
			else
				# Apply discount if one hasn't already applied
				if ($discountPercentage != 0)
					puts "Discount has already been set: #{$discountPercentage}%"
				else
					$discountPercentage = keyedAmount.to_i()
				end;
			end;
		elsif (input == 2) then
			# Add labor charge if one doesn't exisit
				if ($labor != 0)
					puts "Labor had already been charged: $#{$labor}"
				else
					$labor = keyedAmount
				end;
		elsif (input == 1) then
			# Add item charge
			$total += keyedAmount
			$numCharges += 1
		end;
	end;
	# New line after entry
	puts
end

# Exit message
print "Thank you for using #{APP_NAME}"