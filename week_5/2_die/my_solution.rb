# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Array of strings
# Output: Instance methods #sides and #roll.
	#sides: displays the number of sides on the die
	#roll: returns a random string from the input array
# Steps:
# Initialize an instance variable, sides
	# if the array is empty, raise an argument error
# Have the #sides method return the instance variable, sides
# Roll method picks a random string from the array


# 3. Initial Solution

# class Die
#   def initialize(labels)
#   	if labels.empty?
#   		raise ArgumentError, "Array must not be empty"
#   	end
#   	@labels = labels
#   	@sides = labels.size
#   end

#   def sides
#   	@sides
#   end

#   def roll
#   	@labels.sample
#   end
# end

# 4. Refactored Solution

class Die
	attr_reader :sides, :labels

	def initialize(labels)
		raise ArgumentError, "Array must not be empty" if labels.empty?
		@labels = labels
		@sides = labels.size
	end

	def roll
		labels.sample
	end
end

# 1. DRIVER TESTS GO BELOW THIS LINE
array = ["Cat", "Dog", "Horse", "Pig", "Cow"]
d = Die.new(array)

puts d.sides == 5
puts array.include?(d.roll)
puts d.is_a?(Die)

# 5. Reflection
# This challenge was very similar to the first die challenge. The sampling of 
# of labels meant there needed to be one extra attribute, and the class needed
# to adjust to accept an array as an argument. Aside from that, the code is
# almost identical. 

