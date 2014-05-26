# U2.W6: Testing Assert Statements

# I worked on this challenge by myself.


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
#assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# CALL function assert
# INVOKE block
# RAISE "Assertion failed!" unless result of block is true

# first assert: name is equal to bettysue, nothing is raised
# second assert: name is not equal to billybob, "Assertion failed!" is raised


# 3. Copy your selected challenge here

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

# 4. Convert your driver test code from that challenge into Assert Statements

rpn = RPNCalculator.new

assert {rpn.evaluate('0') == 0}
assert {rpn.evaluate('-1') == -1}
assert {rpn.evaluate('1 1 +') == (1 + 1)}
assert {rpn.evaluate('1 -1 +') == (1 - 1)}
assert {rpn.evaluate('2 2 *') == (2 * 2)}
assert {rpn.evaluate('5 10 -') == (5 - 10)}
assert {rpn.evaluate('1 2 3 4 + + +') == (1 + 2 + 3 + 4)}
assert {rpn.evaluate('1 2 + 3 4 + *') == ((2 + 1) * (4 + 3))}
assert {rpn.evaluate('20 10 5 4 + * -') == (20 - 10*(5 + 4))}

a, b, c = Array.new(3) { rand(100) }
assert {rpn.evaluate("#{a} #{b} - #{c} *") == (a-b)*c}

# 5. Reflection
# This challenge was great for understanding exactly what is happening in assert
# statements. While generally it's easy to understand that our driver test code
# is returning true or false and that assert statements work similarly, it was
# beneficial to review blocks and yield statements to understand the flow of the
# code. The challenge itself was not terribly difficult, but I am learning more
# about ruby through the required research!