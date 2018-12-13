#!/usr/bin/ruby
# CIT 383
# Final Exam
# Combs, Lucas

# Need to be able to use files
require 'fileutils'

# Need command line parsing
require 'optparse'

# Need to do date math
require 'date'

# Declare number for no-arg report
DEFAULT_NUM_LOGINS = 90

# Declare paths for files used by report
LOG_FILE_PATH = "logdetail.csv"
REPORT_FILE_PATH = "Report.csv"

# Declare num days to report on
REPORT_ON_OR_AFTER = Date.today - 14

# Return file object for log file
def getLogFile()
	return File.new(LOG_FILE_PATH, 'r')
end

# Generate CSV login report
def loginReport(num_logins)
	# Save an array of fields in log CSV header
	fields = nil

	# Save indexes for fields needed
	logins_field_index = -1
	last_login_field_index = -1
	ip_list_start_index = -1

	# Save any users that show up in search
	users = Array.new()

	# Loop over log entries
	getLogFile().each_line do |line|
		# Report new line character
		line.delete!("\n")

		# Check for first line "header"
		if (fields == nil) then
			# Save fields and needed indexes
			fields =  line.split(",")
			logins_field_index = fields.index("Total Logins")
			last_login_field_index = fields.index("Last Login")
			ip_list_start_index = fields.index("IP Address List")
		else
			# Split up record information
			entries = line.split(",")

			# Grab user data
			user_logins = entries[logins_field_index].to_i()
			user_last_login = Date.strptime(entries[last_login_field_index], '%m/%d/%Y')

			# If user shoudl be in report, add them
			if (user_logins > num_logins &&  user_last_login >= REPORT_ON_OR_AFTER) then
				# Record num logins for user
				entries.insert(ip_list_start_index, entries[ip_list_start_index].split(";").length)

				# Add user to report array
				users.push(entries)
			end
		end
	end

	# Open report file
	report = File.new(REPORT_FILE_PATH, 'w')

	# Add entry to newly created field
	fields.insert(ip_list_start_index, "Num IPs")

	# Print report header row
	fields.each do |col|
		report.print(col + ",")
	end
	report.puts()

	# Add each user to report file
	users.each do |user|
		user.each do |entrie|
			report.print(entrie.to_s() + ",")
		end
		report.puts()
	end
	report.close()
end

# Determine options from command line
def main()
	# Default to DEFAULT_NUM_LOGINS report if no arguments given
	if ARGV.empty? then
		loginReport(DEFAULT_NUM_LOGINS)
		return
	end

	OptionParser.new do |options|
		# Help banner
		options.banner = "USAGE: FinalExam.rb [options] count"

		# Allow user to select num logins
	 	options.on("-c c", "--countlogs c", "Find users with at least C logins") do |c|
	 		loginReport(c.to_i())
	 		return
	 	end

	 	# Implement help message
	 	options.on("-h", "--help", "Print this message") do
	 		puts options
	 		return
	 	end

	end.parse!
end

main()
puts "Done. Report Generated: #{REPORT_FILE_PATH}"