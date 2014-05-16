# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# Input: a number and an optional paramater for padding, called on an array
# Output: the original array with with extra elements if the input number was
# longer than the original array.

# What are the steps needed to solve the problem?
=begin

define pad within the class Array
allow two arguments: a number, and a padding object initialized to nil
if the number is greater than the length of the array
	push the padding (number minus length of array) times
return the array

=end

# 2. Initial Solution
# class Array
# 	def pad(num, padding=nil)
# 		answer = self.map {|i| i}
# 		answer.pad!(num, padding)
# 	end
# end

# class Array
# 	def pad!(num, padding=nil)
# 		if num > size
# 			(num-size).times do
# 				self.push(padding)
# 			end
# 		end
# 		self
# 	end
# end


# 3. Refactored Solution
class Array

	def pad!(num, padding=nil)
		(num-size).times { self << padding } if num > size
		self
	end

	def pad(num, padding=nil)
		Array.new(self).pad!(num, padding)
	end

	def pad_better!(num, padding=nil)
		self.concat(Array.new(num-size, padding)) if num > size
		self
	end
end

# 4. Reflection
# This challenge took a bit of research on my part to determine how to
# manipulate the object the method is called on. I was familiar with the "self"
# terminology from when I worked with Python, but I wasn't sure how to use it 
# within an object in Ruby. Once I felt comfortable with how to manipulate the
# object itself, I first wrote the destructive #pad! method, and then determined
# from there how to transform it into a non-destructive method (I decided that
# calling the destructive method on a new array was the simplest approach). I
# am slowly becoming more familiar with OOP, and thinking in terms of objects is
# becoming more natural. I also found it fairly easy to refactor my initial code
# down from 8 lines to 2. This is encouraging to me, and I'm glad I am getting 
# such beneficial practice on problems such as this one.

# Edit: I looked at this problem again and came up with a better #pad! solution. 
# #pad_better! concatenates a new array with self, and doesn't require a block 
# to be excecuted.