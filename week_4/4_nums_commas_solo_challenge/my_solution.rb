# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# Input: Integer of any length
# Output: Integer separated by commas as a string
# What are the steps needed to solve the problem?
=begin

define separate comma (number)
convert number to string and reverse
create answer variable, initialize to empty string
iterate over range of number length
	add each number to answer
	if index is divisible by three, add comma
return reverse answer

=end

# 2. Initial Solution

def separate_comma_initial(num)
	#convert integer to string and reverse it
	num = num.to_s.reverse

	#initilize answer to empty string
	answer = ""

	#iterate over the indices of the number string
	(0...num.length).each do |i|

		#add each number to the answer
		answer += num[i]

		#as long as this isn't the last number...
		unless i == num.length - 1

			#add a comma after every three numbers
			answer += "," if (i+1) % 3 == 0
		end
	end

	#flip the answer and return it
	return answer.reverse
end


# 3. Refactored Solution

def separate_comma num
	num = num.to_s.reverse
	answer = ""
	(0...num.length).each do |i|
		answer += num[i]
		answer += "," if (i+1) % 3 == 0 unless i == num.length - 1
	end
	answer.reverse
end

# 4. Reflection 
# I'm not entirely sure if this is the most efficient way to solve this problem
# (iteration could take a while on longer numbers), but it works for numbers
# much larger than those tested in the specs which I'm happy about. My gut
# reaction when reading the tests was to write case statements for the length of
# the number, and add commas accordingly. However, when I stepped back and put
# more thought into it, I realized that solution would be limiting, and likely
# require more code than necessary. I'm looking forward to snooping on others'
# repos to see if they have discovered more elegant solutions.

# I also happened to discover #reverse_each earlier today when researching array
# methods. Although I didn't explicity employ this method, remembering it helped
# me come up with my solution of reversing the string before iterating over it.
# I can already tell that by spending time in the docs, I am shifting my thought
# process to solve problems in unique (and hopefully rubyist) ways.