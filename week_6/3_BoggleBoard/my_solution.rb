# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself.


# 2. Pseudocode
# INITIALIZE BoggleBoard with grid
# 	ASSIGN grid to @board

# DEFINE create_word, ACCEPT argument of coords with variable length
# 	MAP coords
# 		FIND letter in nested array
# 	JOIN and RETURN the mapped array

# DEFINE get_row, ACCEPT number as an argument
# 	RETURN @board at the number's position

# DEFINE get_col, ACCEPT number as an argument
# 	MAP @board
# 		FIND the letter at number's position for each nested array
# 	RETURN result

# DEFINE get_coord, ACCEPT array as an argument
# 	RETURN @board [first coord][second coord]

# DEFINE get_diagonal, ACCEPT two coordinates in arrays as arguments
# 	difference between coord1[0] and coord2[0] should be equal to
# 		the difference between coord1[1] and coord2[1]
# 	RAISE AssertionError if this is not true

# 	CREATE ranges between first and second coordinates, TRANSFORM to arrays
# 	MAP the length of arrays
# 		FIND the letter at each coordinate
# 	RETURN result

# 3. Initial Solution
class BoggleBoard
 
	def initialize(board)
		@board = board
	end

	def create_word(*coords)
		coords.map { |coord| @board[coord.first][coord.last]}.join("")
	end

	def get_row(num)
		@board[num]
	end

	def get_col(num)
		@board.map {|x| x[num]}
	end

	def get_coord(coord)
		@board[coord[0]][coord[1]]
	end

	def get_diagonal(first, second)
		unless (first[0] - second[0]).abs == (first[1] - second[1]).abs
			raise "That's not a diagonal!"
		end

		if first[0] < second [0]
			coords_1 = (first[0]..second[0]).to_a
		else
			coords_1 = (second[0]..first[0]).to_a.reverse
		end

		if first[1] < second [1]
			coords_2 = (first[1]..second[1]).to_a
		else
			coords_2 = (second[1]..first[1]).to_a.reverse
		end

		coords = (0...coords_1.size).map {|i| [coords_1[i], coords_2[i]]}
		coords.map { |i| @board[i.first][i.last]}
	end

end

# 4. Refactored Solution
class BoggleBoard
 
	def get_diagonal(first, second)
		unless (first[0] - second[0]).abs == (first[1] - second[1]).abs
			raise "That's not a diagonal!"
		end

		coords_1 = first[0] < second[0] ? (first[0]..second[0]).to_a : (second[0]..first[0]).to_a.reverse
		coords_2 = first[1] < second[1] ? (first[1]..second[1]).to_a : (second[1]..first[1]).to_a.reverse
		(0...coords_1.size).map { |i| @board[coords_1[i]][coords_2[i]] }
	end

end

# 1. DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Assertion error!" unless yield
end

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)

#Create word
assert {boggle_board.create_word([2,1], [1,1], [1,2], [0,3]) == "code"}
assert {boggle_board.create_word([0,1], [0,2], [1,2]) == "rad"}
assert {boggle_board.create_word([0,0], [1,1], [1,1], [3,0]) == "boot"}
assert {boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"}

#Get row
assert {boggle_board.get_row(1) == ["i", "o", "d", "t"]}
assert {boggle_board.get_row(3) == ["t", "a", "k", "e"]}

#Get column
assert {boggle_board.get_col(1) == ["r", "o", "c", "a"]}
assert {boggle_board.get_col(3) == ["e", "t", "r", "e"]}

#Get coordinate
assert {boggle_board.get_coord([2,1]) == "c"}
assert {boggle_board.get_coord([3,2]) == "k"}

#Get diagonal
assert {boggle_board.get_diagonal([0,0], [3,3]) == ["b", "o", "l", "e"]}
assert {boggle_board.get_diagonal([0,3], [3,0]) == ["e", "d", "c", "t"]}
assert {boggle_board.get_diagonal([2,0], [3,1]) == ["e", "a"]}
assert {boggle_board.get_diagonal([3,1], [1,3]) == ["a", "l", "t"]}
assert {boggle_board.get_diagonal([3,2], [1,0]) == ["k", "c", "i"]}

boggle_board.get_diagonal([0,0], [1,0]) rescue
assert { $!.to_s == "That's not a diagonal!" }

# 5. Reflection 
# I feel very comfortable at this point with instance variables and instance
# methods. Refactoring code to create a new class seems very natural, and makes
# more sense than the procedural challenge to me.

# The get_diagonal method was a great thought exercise. I contemplated a number
# of solutions before settling on the one shown here. The logic behind checking
# the diagonal was to see if the absolute difference between each coordinate
# number was the same. If not, it couldn't be a diagonal. If so, I created a
# range between the first numbers of each coordinate, and a seperate range
# between the second numbers of each coordinate. I then transformed these ranges
# into seperate arrays. (I decided that I wanted this method to work on 
# diagonals in any direction, so if the first coordinate was smaller than the
# second, I flipped the range first, transformed it into an array, and then 
# flipped it back. I needed to do this because ranges only work in one
# direction.) These two arrays now represented the first and second numbers
# of the diagonal coordinates respectively. All that was left to do was map the
# coordinates similarly to get_col and return the answer.

# Because of the number of ways I considered approaching this problem, I'm
# interested in checking out the solutions of others. I am positive that someone
# will come up with a simpler and more elegant way of solving it that I hadn't
# even thought of.