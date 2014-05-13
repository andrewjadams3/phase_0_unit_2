# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

#TOTAL
#Input: array of numbers
#Output: sum of all the numbers
=begin 

define total (array)
sum up all numbers using inject

=end

#SENTENCE MAKER
#Input: array of words
#Output: single string of words separated by spaces
# 			(with capitalization and punctuation)
=begin

define sentence maker (array)
join array with " "
remove trailing space
capitalize
add punctuation

=end

# 2. Initial Solution

#TOTAL
def total_initial(array)
	array.inject(:+)
end

#SENTENCE MAKER
def sentence_maker_initial(array)
	sentence = array.join(" ")
	sentence = sentence.capitalize.rstrip
	sentence + "."
end

# 3. Refactored Solution

def total array; array.inject(:+) end

def sentence_maker array; array.join(" ").capitalize.rstrip + "." end


# 4. Reflection 
# I attempted this challenge mostly to learn a bit more about built in string
# methods (I discovered strip, rstrip, and lstrip). I also had fun researching
# how to refactor short methods onto one line. This may not be the most
# desirable way to approach code (the second method is certainly not very
# readable), but it was satisfying to come up with a one-liner!