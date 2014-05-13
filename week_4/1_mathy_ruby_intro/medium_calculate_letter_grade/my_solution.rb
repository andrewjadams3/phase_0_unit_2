# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# Input: Array of numbers
# Output: Letter grade associated with the average of numbers in the input array
# What are the steps needed to solve the problem?
=begin

define get grade (array of numbers)
	find average of array (inject)
	case statement for average
		when between 90 and 100 return "A"
		when between 80 and 90 return "B"
		when between 70 and 80 return "C"
		when between 60 and 70 return "D"
		else return "F"

=end

# 2. Initial Solution

def get_grade_initial(array)
	average = array.inject { |sum, i| sum + i} / array.length
	case average
	when 90..100 then return "A"
	when 80...90 then return "B"
	when 70...80 then return "C"
	when 60...70 then return "D"
	else return "F"
	end
end


# 3. Refactored Solution

def get_grade(array)
	case array.inject(:+) / array.length
		when 90..100 then return "A"
		when 80...90 then return "B"
		when 70...80 then return "C"
		when 60...70 then return "D"
		else return "F"
	end
end

# 4. Reflection 
# This was a nice opportunity to explore the #inject method. I had not used it
# before this challenge, but had come across it in reading. My initial solution 
# passed a block, which allowed me to think through exactly how the #inject
# method functions. In my refactored code, I passed the symbol :+, which is a 
# shorter way to achieve the same outcome (although I admit, after research, I
# still am not entirely sure why it works).