# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Number as an answer
# Output: #guess method and #solved? method
# Steps:
# Initialize class with answer
	# set instance variable @answer to answer
	# set instance variable @solved to false
# define guess with argument "number"
	# if the number is higher than the answer, return high
	# if the number is lower than the answer, return low
	# if the number is equal to the answer, return correct
		# set @solved to true
# define solved?
	# return the value of @solved

# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = answer
#     @solved = false
#   end
  
#   def guess(number)
#   	if number > @answer
#   		@solved = false
#   		:high
#   	elsif number < @answer
#   		@solved = false
#   		:low
#   	else
#   		@solved = true
#   		:correct
#   	end
#   end

#   def solved?
#   	@solved
#   end
# end

# 4. Refactored Solution

class GuessingGame
	def initialize(answer)
		@answer = answer
		@solved = false
	end

  def guess(number)
  	if number == @answer
  		@solved = true
  		:correct
  	else
  		@solved = false
  		number > @answer ? :high : :low
  	end
  end

  def solved?
  	@solved
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE

puts GuessingGame.instance_method(:initialize).arity == 1
puts GuessingGame.method_defined?(:guess) == true
puts GuessingGame.instance_method(:guess).arity == 1
puts GuessingGame.method_defined?(:solved?) == true
puts GuessingGame.instance_method(:solved?).arity == 0

game = GuessingGame.new(10)
puts game.solved? == false
puts game.guess(20) == :high
puts game.guess(5) == :low
puts game.guess(10) == :correct
puts game.solved? == true

# Play the game!!
game = GuessingGame.new rand(100)
last_guess  = nil
last_result = nil

until game.solved?
  unless last_guess.nil?
    puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
    puts ""
  end

  print "Enter your guess: "
  last_guess  = gets.chomp.to_i
  last_result = game.guess(last_guess)
end

puts "#{last_guess} was correct!"

# 5. Reflection

# The biggest benefit of this challenge for me was thinking through each step
# when writing pseudo-code. I believed I knew at the very beginning exactly how
# to structure the code, but writing out the pseudo-code forced me to work
# through the entire problem and realize that my initial idea was slightly off.

# I considered adding an attr_accessor, but realized that would only serve to
# allow users to cheat. I also originally thought #solved? could be an instance
# variable, but re-reading the instructions and working through my pseudo-code
# helped me come up with a better solution.

# Writing my own driver tests based off of the rspec tests gave me a few more
# tools which will allow me to properly test methods. Specifically, methods
# which verify the existence of instance methods and how many arguments they
# accept.
