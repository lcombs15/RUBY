#!/usr/bin/ruby
# CIT 383
# Lab 2
# Combs, Lucas

# Constants
MINS_PER_HOUR = 60
HOURS_PER_DAY = 24
DAYS_PER_WEEK = 7
MINS_PER_WEEK = MINS_PER_HOUR * HOURS_PER_DAY * DAYS_PER_WEEK

# Get data from user
	print "Enter the plan type (C-Commerical, R-Residential, S-Student): "
	planType = gets().chomp().upcase()

	print "Enter the number of talk minutes used: "
	numTalkMinutes = gets().to_i()

# Validate data
	parametersValid = true # Assume data to be valid

	# Check for valid number of talk minutes
	if (numTalkMinutes < 0 || numTalkMinutes > MINS_PER_WEEK)
		parametersValid = false;
		puts "Talk minutes n must be: 0 >= n <= #{MINS_PER_WEEK}. You entered: '#{numTalkMinutes}'."
	end;

	# Check for valid plan type
	if (case planType when "C","R","S" then false else true end)
		parametersValid = false;
		puts "Valid plan types are: C-Commerical, R-Residential, S-Student. You entered: '#{planType}'."
	end;

	# Exit if parameters are not valid
	if (!parametersValid)
		return
	end;

# Calculate Bill
	# Setup price break
	price1, priceBreakPoint, price2, planTitle =
		case planType
			when 'C' then [0.20, 300, 0.10, "Commerical"]
			when 'R' then [0.10, 120, 0.05, "Residential"]
			when 'S' then [0.15, MINS_PER_WEEK, nil, "Student"]
		end

	# Calculate final total based on needed pricing
	if (numTalkMinutes > priceBreakPoint) then
		total = priceBreakPoint * price1
		total += (numTalkMinutes - priceBreakPoint) * price2
	else
		total = numTalkMinutes * price1
	end;

# Print bill summary
	# Print plan type
	puts "\n\nPlan Type: #{planTitle}\n\n"

	# Print bill header
	puts "Item\t\tQuantity\t\tPrice"
	puts "-----\t\t----------\t\t-----"

	# Print bill line item	
	puts "Talk\t\t#{numTalkMinutes}\t\t\t$#{'%.2f' % total}\n\n"

	# Print bill totals
	puts "Total:\t\t\t\t\t$#{'%.2f' % total}"
	puts "Credit:\t\t\t\t\t$25.00"
	puts "#{total > 25 ? "Amount Due" : "Remaining Credit"}: $#{'%.2f' % (25 - total).abs}"
