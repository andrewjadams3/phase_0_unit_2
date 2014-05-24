# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: an equation in reverse polish notation
# Output: the solution to the equation
# Steps:

# WHILE a.length > 1
#   ITERATE through a
#       IF character == +
#           POP last three, set to variable b
#           PUSH sum of first two characters of b to a
#           BREAK
#       REPEAT for - and *
# RETURN a

# 3. Initial Solution

# class RPNCalculator
  
#   def evaluate(eq)
#       a = eq.split(' ') #new array of each number and symbol
#       while a.length > 1 #while the array has more than one character
#           (0...a.length).each do |i| #iterate through the array's indices
#               if a[i] == "+" #if the symbol at this index is a +
#                   b = a.slice!(i-2, 3) #remove the previous symbols, assign them to b
#                   a.insert(i-2, b[0].to_i + b[1].to_i) #add the numbers, push them back
#                                         #into the array in the correct location
#                   break #leave the loop
#               elsif a[i] == "-" #same thing for -
#                   b = a.slice!(i-2, 3)
#                   a.insert(i-2, b[0].to_i - b[1].to_i)
#                   break
#               elsif a[i] == "*" #same thing for *
#                   b = a.slice!(i-2, 3)
#                   a.insert(i-2, b[0].to_i * b[1].to_i)
#                   break
#               end
#           end
#       end
#       a[0].to_i #return the answer
#   end
# end


# 4. Refactored Solution

class RPNCalculator
  
  def evaluate(eq)
    a = eq.split(' ')
    while a.length > 1
        (0...a.length).each do |i|
            if ["+", "-", "*"].include?(a[i])
                b = a.slice!(i-2, 3)
                a.insert(i-2, b[0].to_i.send(b[2], b[1].to_i))
                break
            end
        end
    end
    a[0].to_i
  end

end

# 1. DRIVER TESTS GO BELOW THIS LINE
rpn = RPNCalculator.new

puts rpn.evaluate('0') == 0
puts rpn.evaluate('-1') == -1
puts rpn.evaluate('1 1 +') == (1 + 1)
puts rpn.evaluate('1 -1 +') == (1 - 1)
puts rpn.evaluate('2 2 *') == (2 * 2)
puts rpn.evaluate('5 10 -') == (5 - 10)
puts rpn.evaluate('1 2 3 4 + + +') == (1 + 2 + 3 + 4)
puts rpn.evaluate('1 2 + 3 4 + *') == ((2 + 1) * (4 + 3))
puts rpn.evaluate('20 10 5 4 + * -') == (20 - 10*(5 + 4))

a, b, c = Array.new(3) { rand(100) }
puts rpn.evaluate("#{a} #{b} - #{c} *") == (a-b)*c

# 5. Reflection
# I am satisfied that I created a working solution, but I still have several
# concerns. First, although my logic was essentially correct when writing the
# pseudo-code, I did not think ahead and realize that popping the last three
# symbols would take them from the end, rending my solution useless for
# equations longer than three characters. Along those same lines, pushing the
# the calculated answer would again put them on the end, which would create a 
# similar problem. Once I researched the correct methods for removing and
# inserting items from arrays at certain positions, my design worked.

# Secondly, my solution requires a lot of iteration. Ideally, once two numbers
# are popped, evaluated, and put back in the array, the #each loop should
# continue where it left off. However, since the array is being modified, the 
# only way I could see my solution working would be to restart the each loop
# any time I adjusted the array. I would like to know if there is a way to 
# specify where a loop should pick up and continue once a block is evaluated.

# Finally, my code is barely readable. I toyed around with assigning descriptive
# variables for each symbol (like first_number, second_number, and operator),
# but that seemed to add a lot of unecessary code and didn't do a huge amount
# for readability. My refactored code is the bigger culprit, and perhaps I would
# have been better off keeping the control flow from my original code. Looking 
# now, I doubt there is much of a difference performance wise, it just isn't
# very DRY.