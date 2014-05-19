# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: credit card number
# Output: instance methods initialize and check card
	#check_card returns true if the card is valid, false otherwise
# Steps:
# Define Credit Card class
	# recieves a credit card number as an argument
	# raise an argument error if the card length is not equal to 16
# Define check_card method
	# takes no arguments
	# convert card number to string, split on whitespace, map to integers
		# set to new variable
	# map all numbers, double those on even indices
		# set to new variable
	# convert to string, split on whitespace, map to integers
		# set to new variable	
	# if the sum modulo 10 is equal to zero, return true: otherwise, false


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits

# class CreditCard
# 	def initialize(card_number)
# 		if card_number.to_s.length != 16
# 			raise ArgumentError, "Card number must be 16 digits"
# 		end
# 		@card_number = card_number
# 	end

# 	def check_card
# 		split_num = @card_number.to_s.split('').map {|i| i.to_i}
# 			# convert to string, split on each char, map a new array by converting
# 			# each char to an integer.

# 		doubled = (0...16).map {|i| i % 2 == 0 ? split_num[i] * 2 : split_num[i]}
# 			# note #1: since we know the length of the card is 16 digits, we can map 
# 			# the range of 0 to 16 (non inclusive) to find the indices of each number
# 			# in the split array.

# 			# note 2: the instructions say to double every other number, starting from
# 			# the second to last number. Again, since we know the card is 16 digits
# 			# long, this means we can just double numbers on even indices. If this
# 			# were not a credit card number, we could simply reverse the array and
# 			# double numbers on odd indices.

# 		answer = doubled.to_s.split('').map {|i| i.to_i}
# 			# convert to string, split on each char, map a new array by converting
# 			# each char to an integer.

# 		answer.inject(:+) % 10 == 0
# 			# find the sum of all integers in the answer array, check if the numer is
# 			# divisible by 10 (this will return true or false).
# 	end

# end



# 4. Refactored Solution
class CreditCard
	def initialize(card_number)
		if card_number.to_s.length != 16
			raise ArgumentError, "Card number must be 16 digits"
		end
		@card_number = card_number
	end

	def int_split(string)
		string.split('').map(&:to_i)
	end

	def check_card
		nums = int_split(@card_number.to_s)
		doubled = (0...16).map {|i| i.even? ? nums[i]*2 : nums[i]}
		answer = int_split(doubled.join)
		answer.inject(:+) % 10 == 0
	end

end


# 1. DRIVER TESTS GO BELOW THIS LINE
puts CreditCard.instance_method(:initialize).arity == 1
puts CreditCard.instance_method(:check_card).arity == 0

real_card = CreditCard.new(4408041234567893)
puts real_card.check_card == true

fake_card = CreditCard.new(4408041234567892)
puts fake_card.check_card == false

# 5. Reflection
# This was a fun challenge! The algorithm seemed complicated, but was actually 
# quite simple to understand (especially after reading the explanation on
# wikipedia). Writing out the pseudo-code was very beneficial. It helped me 
# catch errors in my logic before beginning the code.

# When coding, I did run into a few changes which I needed to make on the fly
# Specifically, I accidentally used an inclusive range which raised errors.
# Using print debugging was helpful, and helped me catch my mistake within a few
# minutes. I also originally was planning to map each element and simply double
# the even ones, but I quickly realzed that would be difficult if I didn't map 
# a range instead.

# I refactored my code slightly to use the #even? method, and to pass #to_i as a
# symbol several times. My code is short, but my main concern is readability. I
# included comments in my original code so I could keep track of what I was
# doing. I read through the python solution provided on wikipedia after I
# refactored my code, and found it much simpler to understand (although there
# were some built-in methods employed which aren't found in ruby). The solution
# was longer and had a few more steps, but I doubt there is any difference in
# performance for such a simple algorithm. I may return later to refactor in
# order to improve readability.
