#!/usr/bin/ruby
# CIT 383
# Lab 3
# Combs, Lucas

sum = 0
print("Enter an integer value (0 to quit): ")
value = gets().to_i()
while (value != 0) do
sum += value;
print("Enter next value: ")
value = gets().to_i()
end
puts("The sum of the entered values is: #{sum}")