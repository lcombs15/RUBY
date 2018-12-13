#!/usr/bin/ruby
# CIT 383
# Final Exam
# Combs, Lucas

# Need to be able to use files
require 'fileutils'

# Need command line parsing
require 'optparse'

# Determine options from command line
def parseCommandLine()

	# Default to help command if not arguments given
	if ARGV.empty? then
		ARGV[0] = "--help"
	end

	OptionParser.new do |options|

		options.banner = "USAGE: FinalExam.rb [options] count"

	 	options.on("-c c", "--countlogs c", "Find users with at least C logins") do |c|
	 		puts "Will find: #{c} logins."
	 		return
	 	end

	 	options.on("-h", "--help", "Print this message") do
	 		puts options
	 		return
	 	end
	end.parse!
end

parseCommandLine()