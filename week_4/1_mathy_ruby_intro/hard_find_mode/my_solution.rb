# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

=begin

INITAL SOLUTION
Input: array of unique items
Output: array of most frequent values

define mode (array)
sort array
count variable = 0
current_pos = first item in array

highest count = 0
answer = empty array

iterate through array (i)

if i is equal to current_pos
	increase count by one

else

	if count equals highest count
		push previous i to end of answer array
	else if count is higher than highest count
		highest count equal count
		answer = [previous i]

	count = 1
	current_pos = i

SIMPLER SOLUTION
create hash based off of frequency of items
find the max frequency
return all items from hash with max frequency

=end


# 2. Initial Solution
def mode_initial(array)
	array.sort!.push("")
	count = 0
	current_pos = array[0]

	highest_count = 0
	answer = [ ]

	array.each do |i|
		if i == current_pos
			count += 1
		else
			if count == highest_count
				answer.push(current_pos)
			elsif count > highest_count
				answer = [current_pos]
				highest_count = count
			end

			current_pos = i
			count = 1
		end
	end

	answer
end


# 3. Refactored Solution

def mode(array)
	answer = [ ]
	items = Hash.new(0)
	array.each {|i| items[i] += 1}
	items.each {|k, v| answer.push(k) if v == items.values.max}
	answer
end

# 4. Reflection 

=begin

This was a fun challenge! I certainly fell into the trap of thinking like a
person rather than a computer at first pass. I came up with a complicated
solution and decided to stick with it, rather than make it more elegant. My
long solution worked, but looking at the code I knew I could do better. When I
spent a little more time thinking about the tools available to me in Ruby, I
quickly came up with my more elegant solution. In the future, I will spend more
time considering alternate solutions before jumping into the first one I come
up with. A lot of the work I coded in my first solution could be accomplished 
through built-in methods in Ruby. The more I learn and become familiar with
these methods, the quicker I believe I will be able to come up with solutions
to problems like these that require less code.

=end