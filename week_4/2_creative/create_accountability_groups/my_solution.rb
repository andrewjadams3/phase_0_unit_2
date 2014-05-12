# U2.W4: Create Accountability Groups


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: Array of names
# Output: Hash with group number as keys, arrays of names as values
# Steps:

=begin

define sort_groups (array of names)
	# of groups = length of array / 4 (integer division)
	group counter = 1
	group hash = new hash with default value: empty array
	iterate through array of names
		group hash at [group counter] push name
		if group counter == # of groups
			set group counter to one
		else
			add one to group counter
	return group hash

=end


# 3. Initial Solution
def sort_groups_initial(array)
	#Set number of groups (one if there are less than four people)
	group_num = array.length / 4
	group_num = 1 if array.length < 4

	counter = 1

	#Create a new hash with a default value of an empty array for any key
	group_hash = Hash.new { |k,v| k[v] = [ ] }

	array.each do |i|
		#Add name to group number
		group_hash[counter] << i

		#Increase group number, or loop back to first group
		if counter == group_num
			counter = 1
		else
			counter += 1
		end
	end

	return group_hash
end



# 4. Refactored Solution

def sort_groups(array)
	array.length <= 4 ? group_num=1 : group_num=array.length/4
	counter = 1
	group_hash = Hash.new { |k,v| k[v] = [ ] }
	array.each do |i|
		group_hash[counter] << i
		counter == group_num ? counter=1 : counter+=1
	end
	group_hash
end




# 1. DRIVER TESTS GO BELOW THIS LINE
group_1 = ["Andrew", "Sarah", "Mike", "Sam"]
group_2 = ["Bill", "Mike"]
group_3 = ["Tom", "Jerry", "Heather", "Emily",
					"Amy", "Drew", "Kyle", "Nick"]
group_4 = ["Tom", "Jerry", "Heather", "Emily",
					"Amy", "Drew", "Kyle", "Nick",
					"Andrew", "Sarah"]
group_5 = ["Tom", "Jerry", "Heather", "Emily",
					"Amy", "Drew", "Kyle", "Nick",
					"Andrew", "Sarah", "Bill", "Tammy"]
group_6 = [ ]

hash_1 = sort_groups(group_1)
hash_2 = sort_groups(group_2)
hash_3 = sort_groups(group_3)
hash_4 = sort_groups(group_4)
hash_5 = sort_groups(group_5)
hash_6 = sort_groups(group_6)

puts hash_1[1] == ["Andrew", "Sarah", "Mike", "Sam"]
puts hash_2[1] == ["Bill", "Mike"]
puts hash_3[1] == ["Tom", "Heather", "Amy", "Kyle"]
puts hash_4[2] == ["Jerry", "Emily", "Drew", "Nick", "Sarah"]
puts hash_5[3] == ["Heather", "Drew", "Andrew", "Tammy"]
puts hash_6[1] == [ ]

# 5. Reflection
=begin
This was a challenge that required a bit of thought on my part. Luckily, writing
out the driver tests before I started to tackle the problem forced me to walk
through several different error-scenarios in my head before I even began writing
code. I am beginning to see the real benefits of TDD

I did get stuck at one part of my code. I initially initialized my group_hash as
Hash.new([ ]), which was not behaving the way I expected. After some research, I
discovered that I need to specify a block so that any new key would have the
value of an empty array. I'm still not entirely sure why this is, but I am now
aware of some potential limitations of hashes and have a few new troubleshooting
tools.

My solution will return the same groups every time, but can easily be modified
by including array.shuffle! at the beginning of the method. I suppose this might
be preferred for the purposes of DBC when trying to gain experience working with
as many people as possible. However, implmenting this would break all of my
tests, so I'll call it good for now :)
=end


