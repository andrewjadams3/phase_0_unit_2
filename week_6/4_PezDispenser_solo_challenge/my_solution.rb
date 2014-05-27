# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge by myself.

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode
# CREATE PexDispenser class
# 	DEFINE initialize
# 		takes one argument: an array of flavor
# 		ASSIGN flavors to @flavors
# 		ASSIGN flavors.size to @pez_count

# 	ASSIGN attr_reader :pez_count

# 	DEFINE see_all_pez
# 		takes no arguments
# 		ITERATE over @flavors
# 			puts each flavor

# 	DEFINE add_pez
# 		takes one argument: a string
# 		push string to end of @flavors
# 		add 1 to @pez_count

# 	DEFINE get_pez
# 		takes no arguments
# 		subtract one from @pez_count
# 		REMOVE and RETURN first flavor from @flavors


# 3. Initial Solution

class PezDispenser

	attr_reader :pez_count

	def initialize(flavors)
		@flavors = flavors.clone
		@pez_count = flavors.size
	end

	def see_all_pez
		unless @flavors.empty?
			@flavors.each { |x| puts "-" + x }
		else
			puts "This pez dispenser is empty!"
		end
	end

	def add_pez(flavor)
		@flavors << flavor
		@pez_count += 1
	end

	def get_pez
		@pez_count -= 1
		@flavors.shift
	end
 
end

# 4. Refactored Solution



# 1. DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Assertion error!" unless yield
end

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
assert {super_mario.pez_count == 10}
puts "Now you have #{super_mario.pez_count} pez!"
puts "Oh, you want one do you?"
new_pez = super_mario.get_pez
assert {new_pez == flavors.first}
puts "The pez flavor you got is: #{new_pez}"
assert {super_mario.pez_count == 9}
puts "Now you have #{super_mario.pez_count} pez!"


# 5. Reflection 
# While I felt fairly comfortable with this challenge, I ended up learning quite
# a bit about classes through a number of errors. I had completed most of the
# challenge, but was noticing something was odd with my driver tests. I wanted
# to check that #get_pez was pulling the first pez in the @flavors array by 
# comparing it to the first pez in the original flavors array. However, every 
# time I called #get_pez, my original flavors array was modified. After some
# research and asking questions on Stack Overflow, I discovered that by
# passing in the flavors array to my new PezDispenser and settting @flavors to
# to flavors in the initialize method, @flavors was actually pointing directly
# to the original flavors array. The solution was to initialze @flavors to 
# flavors.clone, having it point to a clone of the array, and preventing
# modification of the original. While this wasn't strictly necessary for the
# challenge, I was unaware that instance variables worked in this way, and will
# be much more careful in the future so that destructive methods don't end up
# being called on variables with more than one alias.