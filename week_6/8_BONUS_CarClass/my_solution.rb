# U2.W6: Create a Car Class from User Stories


# I worked on this challenge by myself.


# 2. Pseudocode
# CREATE Car class
# 	DEFINE initialize(color, model)
# 		ASSIGN @color to color
# 		ASSIGN @model to model
# 		ASSIGN @direction to array of "North", "East", "South", and "West"
# 		ASSIGN @speed to 0
# 		ASSIGN @distance to 0

# 	SET attr_reader :speed, :distance

# 	DEFINE direction
# 		"You are headed: " + @direction at first position

# 	DEFINE drive(distance, speed)
# 		SET @speed to speed
# 		ADD distance to @distance
# 		"You are now driving at 'speed' mph."

# 	DEFINE stop
# 		SET @speed to zero
# 		"You are now stopped."

# 	DEFINE turn(direction)
# 		IF direction is equal to "right"
# 			ROTATE @direction by 1
# 		ELSE IF direction is equal to "left"
# 			ROTATE @direction by -1
# 		"You have turned 'direction' and are now headed '@direction'"


# 3. Initial Solution
class Car
	attr_reader :speed, :distance

	def initialize(color, model)
		@color = color
		@model = model
		@direction = %w(North East South West)
		@speed = 0
		@distance = 0
	end

	def direction
		@direction[0]
	end

	def drive(distance, speed)
		@speed = speed
		@distance += distance
		puts "You are driving at #{@speed} mph."
	end

	def stop
		@speed = 0
		puts "You are now stopped."
	end

	def turn(steering)
		if steering == "right"
			@direction.rotate!(1)
		else
			@direction.rotate!(-1)
		end
		puts "You have turned #{steering} and are now headed #{direction}."
	end

end


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Assertion error!" unless yield
end

pizza_car = Car.new("black", "Versa")

puts "Head north for your first delivery! Speed limit is 25 mph."
pizza_car.drive(0.25, 25)
assert {pizza_car.direction == "North"}
assert {pizza_car.speed == 25}

puts "Stop sign ahead!"
pizza_car.stop
assert {pizza_car.speed == 0}

pizza_car.turn("right")
assert {pizza_car.direction == "East"}

puts "Speed limit is now 35 mph."
pizza_car.drive(1.5, 35)
assert {pizza_car.speed == 35}

puts "School zone ahead! Speed limit is 15 mph."
pizza_car.drive(0.25, 15)
assert {pizza_car.speed == 15}

puts "Stop sign ahead!"
pizza_car.stop
assert {pizza_car.speed == 0}

pizza_car.turn("left")
assert {pizza_car.direction == "North"}

puts "Speed limit is now 35 mph."
pizza_car.drive(1.4, 35)
assert {pizza_car.speed == 35}

puts "Destination ahead!"
pizza_car.stop
assert {pizza_car.speed == 0}
assert {pizza_car.distance == 3.4}

puts "You have arrived at your destination! You have traveled a total distance of #{pizza_car.distance} miles."

# 5. Reflection 