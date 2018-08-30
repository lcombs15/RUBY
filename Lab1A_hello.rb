#!/usr/bin/ruby
print("hello")
print("world")
print("\n") #Blank line
puts("hello")
puts("world")
puts("\n") #2 Blank lines. Why?
print("Enter your name: ") # By using print, the cursor stays on the same line when the user enters in name
fname = gets() # Wait until user enters in data and hits <Enter> key
puts("Hello " + fname + ". Welcome to CIT 383")
puts("Hello " + fname.chomp() + ". Welcome to CIT 383")
puts("Hello " + fname + ". Welcome to CIT 383") # Notice it does not alter the original value
fname = fname.chomp()
puts("Hello " + fname + ". Welcome to CIT 383")

