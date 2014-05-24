# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge by myself.

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
# Use provided code, estimate second driver test result by looking at indices.

# Initial Solution
def create_word(board, *coords)
  coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution
# No need to refactor

# DRIVER TESTS GO BELOW THIS LINE
puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) == "code"
puts create_word(boggle_board, [0,1], [0,2], [1,2])  == "rad"
puts create_word(boggle_board, [0,0], [1,1], [1,1], [3,0]) == "boot"

# Reflection 
# Very simple review, I am comfortable accessing nested elements.

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# Define get_row, takes an board and one number as an argument
# return the board at the index of the number

# Initial Solution
def get_row(board, num)
	board[num]
end

# Refactored Solution
# No need to refactor

# DRIVER TESTS GO BELOW THIS LINE
puts get_row(boggle_board, 1) == ["i", "o", "d", "t"]
puts get_row(boggle_board, 3) == ["t", "a", "k", "e"]

# Reflection 
# Again, this challenge was very straightforward. To get the expected result, I
# only had to return the array which resided at the index passed to the method.


<<<<<<< HEAD
#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the
# elements in the column.

# Pseudocode
# Define get_col, takes a board and one number as an argument
# #map the length of the board (non-inclusive range), selecting only the
	# elements that reside at the subindex passed as the number argument

# Initial Solution
def get_col(board, num)
	(0...board.size).map { |i| board[i][num] }
end

# Refactored Solution
# No need to refactor

# DRIVER TESTS GO BELOW THIS LINE
puts get_col(boggle_board, 1) == ["r", "o", "c", "a"]
puts get_col(boggle_board, 3) == ["e", "t", "r", "e"]

# Reflection 
# This final part required a little more thought, but was still fairly simple to
# accomplish. In order to simply and quickly find each column element, it was 
# easier to map a range equalling the length of the board. This will iterate
# over each index. Then from there, I only had to return the subindex which
# corresponded to the column. I didn't necessarily learn anything new, but
# thinking in terms of nested arrays is always a beneficial thought exercise.
=======
>>>>>>> upstream/master
