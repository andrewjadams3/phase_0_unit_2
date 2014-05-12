# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

=begin

Input: array of numbers
Output: the median of the array

define median(array)
	sort the array
	middle = array length / 2 (find middle index)
	if array is odd length
		array[middle] (return the middle number)
	else
		( array[middle] + array [middle+1] ) / 2.0 (return average of middle nums)
	end
end

=end


# 2. Initial Solution

=begin

def median(array)
	array.sort!
	middle = array.length / 2
	if array.length % 2 != 0
		array[middle]
	else
		(array[middle-1] + array[middle]) / 2.0
	end
end

=end


# 3. Refactored Solution

def median(array)
	#sort array from smallest to largest
	array.sort!

	#find the "middle" index
	middle = array.length / 2

	#if the array has an odd number of items
	if array.length % 2 != 0
		#return the number at the middle index
		array[middle]

	#if the array has an even number of items
	else
		#take the two middle numbers and return the average
		(array[middle-1] + array[middle]) / 2.0
	end
end

# 4. Reflection 
=begin

Since I have attempted this challenge in several other languages before (Python
and JavaScript), I felt fairly confident implementing a solution in Ruby. This
was good practice running through the Rspec tests before attempting to complete
the challenge. Rspec is very interesting, I'm looking forward to writing my own
tests soon. I like how the error messages are very descriptive, and the tests
are written in a way that can show which parts of your code are functional and
which aren't.

=end