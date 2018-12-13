#!/usr/bin/ruby
# CIT 383
# Lab 12
# Combs, Lucas


require 'optparse'
require 'fileutils'


options_parser = OptionParser.new()

options_parser.banner = "USAGE: Lab12.rb [options] [file]"

log_file = nil

options_parser.on("-l", "--log LOGFILE", "Specify log file") do |l|
        log_file = File.new(l, 'w')
end

options_parser.parse!

output = ""

Dir.new(".").each do |item|
	if (item != "." && item != "..")
		ouput = "#{ouput}#{item}\n"
	end
end

if log_file.nil?
	puts output
	puts "Done."
else
	log_file.puts(output)
	log_file.close()
	puts "Wrote to log file."
end