#!/usr/bin/ruby -w
# CIT 383
# Midterm - 11 Oct 2018
# Combs, Lucas

# Define constants
NUM_JUDGES = 5
MIN_SCORE = 5
MAX_SCORE = 10
MIN_PERFORMERS = 1
MAX_PERFORMERS = 10

# Get input for user
num_performers = 0
while (num_performers < MIN_PERFORMERS || num_performers > MAX_PERFORMERS) do
	print "Please enter the number of performers (#{MIN_PERFORMERS}-#{MAX_PERFORMERS}): "
	num_performers = gets().to_i()	
end

scores = Array.new(num_performers) {Array.new(NUM_JUDGES, 0)}
sums = Array.new(num_performers,0)
# Generate Scores
for p in 0...num_performers
	for j in 0...NUM_JUDGES
		# Generate & store random score
		score = rand(MIN_SCORE..MAX_SCORE)

		# Record score for performer
		scores[p][j] = score

		# Add score to performer total
		sums[p] += score
	end
end

# Calculate averages
average = Array.new(num_performers)
for p in 0...num_performers
	# Grab scores
	player_scores = scores[p]

	# Calculate avg
	average[p] = (sums[p] - (player_scores.min() + player_scores.max())) / (NUM_JUDGES - 2).to_f

	# Round avg
	average[p] = average[p].round(2)
end

# Print report heading
print "Perf ID\t\t"

# Each judge gets a column
for j in 0...NUM_JUDGES
	print "Judge #{j + 1}\t\t"
end
print "Avg\n"

# Each column gets an underline
(NUM_JUDGES + 2).times {print "-------\t\t"}

# New line after underlines
puts

# Print scores by performer
for p in 0...num_performers
	# Print performer #
	print "#{p + 1}\t\t"

	# Print scores for judges
	for j in 0...NUM_JUDGES
		print "#{scores[p][j]}\t\t"
	end

	# Print average
	print "#{average[p]}\n"
end