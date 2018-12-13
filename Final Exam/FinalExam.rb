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

# Declare path for log file used by report
LOG_FILE_PATH = "logdetail.csv"

# Declare num days to report on
REPORT_ON_OR_AFTER = Date.today - 14

def getLogFile()
	return File.new(LOG_FILE_PATH, 'r')
end

def loginReport(num_logins)
	first_line = nil
	count = 0
	logins_field_index = -1
	last_login_field_index = -1
	getLogFile().each_line do |line|
		if (first_line == nil) then
			first_line = line
			fields =  first_line.split(",")
			logins_field_index = fields.index("Total Logins")
			last_login_field_index = fields.index("Last Login");
		else
			entries = line.split(",")
			user_logins = entries[logins_field_index].to_i()
			user_last_login = Date.strptime(entries[last_login_field_index], '%m/%d/%Y')
			if (user_logins > num_logins &&  user_last_login >= REPORT_ON_OR_AFTER) then
				count = count + 1
			end
		end
	end
	puts count
end

# Determine options from command line
def main()

	# Default to DEFAULT_NUM_LOGINS report if no arguments given
	if ARGV.empty? then
		loginReport(DEFAULT_NUM_LOGINS)
		return
	end

	OptionParser.new do |options|

		options.banner = "USAGE: FinalExam.rb [options] count"

	 	options.on("-c c", "--countlogs c", "Find users with at least C logins") do |c|
	 		loginReport(c.to_i())
	 		return
	 	end

	 	options.on("-h", "--help", "Print this message") do
	 		puts options
	 		return
	 	end
	end.parse!
end

main()