# U2.W6: Drawer Debugger


# I worked on this challenge by myself.


# 2. Original Code

class Drawer
	attr_reader :contents

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = @contents.pop)
		@contents.delete(item)
	end

	def dump
		@contents = []
		puts "Your drawer is empty."
	end

	def view_contents
		unless @contents.empty?
			puts "The drawer contains:"
			@contents.each {|silverware| puts "- " + silverware.type }
		else
			puts "The drawer is empty."
		end
	end

end

class Silverware
	attr_reader :type, :clean

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "Eating with the #{type}..."
		@clean = false
	end

	def clean_silverware
		@clean = true
	end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")

silverware_drawer.add_item(sharp_knife)
silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents

new_fork = Silverware.new("fork")
silverware_drawer.add_item(new_fork)
fork = silverware_drawer.remove_item(new_fork)
fork.eat

puts fork.clean


# DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Assertion error!" unless yield
end

assert { silverware_drawer.contents.empty? == true }
silverware_drawer.add_item(Silverware.new("spork"))
assert { silverware_drawer.contents.empty? == false }

assert { fork.clean == false }
fork.clean_silverware
assert { fork.clean == true }

# 5. Reflection
# This challenge was a little frustrating at first because I wasn't sure if we
# were allowed to add new method calls or simply edit the existing methods to 
# force the method calls to work. I decided in the end to add a method call to
# the silverware drawer to add a fork in order to get the following call to
# remove and assign a new fork variable to work. I'm still not entirely sure
# that this is what the challenge was asking, but everything works fine at this
# point. Overall, I feel comfortable understanding and debugging code, and have
# a fairly solid grasp on instance methods and variables. 