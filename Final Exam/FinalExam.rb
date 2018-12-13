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
	fields = nil
	count = 0
	logins_field_index = -1
	last_login_field_index = -1
	ip_list_start_index = -1
	users = Array.new()
	getLogFile().each_line do |line|
		line.delete!("\n")
		if (fields == nil) then
			fields =  line.split(",")
			logins_field_index = fields.index("Total Logins")
			last_login_field_index = fields.index("Last Login")
			ip_list_start_index = fields.length - 1
		else
			entries = line.split(",")

			if (entries == nil)
				puts line
			end

			user_logins = entries[logins_field_index].to_i()
			user_last_login = Date.strptime(entries[last_login_field_index], '%m/%d/%Y')
			if (user_logins > num_logins &&  user_last_login >= REPORT_ON_OR_AFTER) then
				entries.insert(ip_list_start_index, entries[ip_list_start_index].split(";").length)
				users.push(entries)
			end
		end
	end

	report = File.new("Report.csv", 'w')

	fields.insert(ip_list_start_index, "Num IPs")
	header = ""
	fields.each do |col|
		header = header + col + ","
	end

	report.puts(header)

	users.each do |user|
		line = ""
		user.each do |entrie|
			line = line + entrie.to_s() + ","
		end
		report.puts(line)
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
puts "Done"