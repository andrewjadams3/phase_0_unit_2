# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: Number of sides
# Output: Instance methods #sides and #roll.
	#sides: displays the number of sides on the die
	#roll: returns a random number side
# Steps:
# Initialize an instance variable, sides
	# if sides is less than 1, raise an argument error
# Have the #sides method return the instance variable, sides
# Roll method picks a random number between 1 - # of sides

# 3. Initial Solution

# class Die
#   def initialize(sides)
#   	if sides < 1
#     	raise ArgumentError.new("Must be a positive number")
#   	end
#     @sides = sides
#   end
  
#   def sides
#     @sides
#   end
  
#   def roll
#     rand(1..@sides)
#   end
# end



# 4. Refactored Solution
class Die
	attr_reader :sides

	def initialize (sides)
		raise ArgumentError, "Must be a positive number" if sides < 1
		@sides = sides
	end

	def roll
		rand(1..sides)
	end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
d = Die.new(8)

puts d.sides == 8
puts (1..8).include?(d.roll)
puts d.is_a?(Die)


# 5. Reflection 
# This was a good review. I became familiar with objects in python first, and
# then practiced creating objects in ruby when reading through Chris Pine's
# book. I remembered that attr_reader is essentially a replacement for the sides
# instance method, so I chose to implement that in my refactored code.
# attr_accessor would have worked as well, but it would not have been in keeping
# with the original code. I also discovered a simpler way to raise Argument
# Errors which is a bit more readable in my opinion. (My source was this SO
# question:
# http://stackoverflow.com/questions/21353945/is-there-a-way-to-test-argument
# -errors-from-within-a-method-to-return-true-or-fa
# looks like someone from DBC!)