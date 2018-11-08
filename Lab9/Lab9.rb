#!/usr/bin/ruby
# CIT 383
# Lab 9
# Combs, Lucas

require 'fileutils'

# Given path, returns type
def getInodeType(path)
	return File.directory?(path) ? "Directory" : "File"
end

# List all items in given dir
def listEntries(dir)
	puts	"Item\t\t\tType\n"\
			"-------\t\t\t---------"
	Dir.new(dir).each do |item|
		if (item != "." && item != "..")
			puts "#{item}\t\t#{getInodeType(item)}"
		end
	end	
end

# Create n empty files in dir
def createFiles(dir, numFiles)
	for i in 1..numFiles
		f = File.new("test_#{i}.txt", "w")
		f.close()
	end
end

# Create n empty files in dir
def createSubDirectories(dir, numDirs)
	for i in 1..numDirs
		FileUtils.mkdir("subdir_#{i}")
	end
end

# rename all files in dir from .txt --> .text
def renameFiles(dir)
	Dir.new(dir).each do |item|
		if (item.end_with?(".txt") && getInodeType(item) != "Directory")
			FileUtils.mv(item, item[0..item.length-4] + "text")
		end
	end	
end

def pwd()
	puts "Curent Directory: #{Dir.pwd}"	
end

# Print current directory
pwd()

# Make dir and change into it
FileUtils.mkdir("Lab9")
FileUtils.cd("Lab9")

# Print current directory after cd
pwd()

# Make new empty files and dirs
createFiles(".", 10)
createSubDirectories(".", 5)

# List contents
listEntries(".")

renameFiles(".")

# New line for formatting
puts

# List again after renaming files
listEntries(".")