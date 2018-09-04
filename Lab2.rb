#!/usr/bin/ruby

# CIT 383
# Lab 2
# Combs, Lucas

#Get data from user
print "Enter the plan type (C-Commerical, R-Residential, S-Student): "
planType = gets().chomp().upcase()

print "Enter the number of talk minutes used: "
numMinutes = gets().to_i()
