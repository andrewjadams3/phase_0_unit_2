# U2.W4: Refactor Cipher Solution


# I worked on this challenge with Jonathan Young and Spencer Zhang.


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence) # We are defining a new method called translate_to_cipher which takes one argument as its parameter which we set to a variable called sentence.
    alphabet = ('a'..'z').to_a # We are assigning a variable called alphabet that includes an array that contains the range of letters from a to z
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] # Creating a new hash that contains the reverse of the original cipher
    spaces = ["@", "#", "$", "%", "^", "&", "*"] # assign a variable spaces to an array containing symbol elements saved as strings
    
    original_sentence = sentence.downcase #assign a variable original_sentence to your original input that's made lowercase
    encoded_sentence = [] #set a new empty array called encoded_sentence
    original_sentence.each_char do |element| # We iterate through each character in the original_sentence variable and shove it to the variable element
      if cipher.include?(element) # If your cipher hash includes the letter from the original_sentence variable
        encoded_sentence << cipher[element] # Shove the ciphered element into encoded_sentence
      elsif element == ' ' # Else if your element is equal to a space
        encoded_sentence << spaces.sample # Shove a random symbol found in the spaces array back into the encoded_sentence array
      else # Everything else
        encoded_sentence << element # Stays the same but shove it into the encoded_sentence
      end
     end
    
    return encoded_sentence.join # Joining everything together as a string (join method auto-returns a string)
end


# Questions:
# 1. What is the .to_a method doing?
  # Translating the range into an array containing everything in that range.
# 2. How does the rotate method work? What does it work on?
  # Works on arrays and it rotates everything around by their index
# 3. What is `each_char` doing?
  # It calls each character
# 4. What does `sample` do?
  # Selects a random element (sample) from the array.
# 5. Are there any other methods you want to understand better?
  # Zip was difficult to understand
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
  # It only looks slightly better because it has a simpler cipher solution.
  # However, there were some unnecessary things, such as line 19's array and
  # line 30's .join. Unnecessary.

# 7. Is this good code? What makes it good? What makes it bad?
  # It is good code because it's concise and won't require the computer to use 
  # a lot of RAM to test it.

# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")

# No, due to line 23, you will get a random symbol, resulting in different
# outputs every time.




# 5. Reflection 
# I was happy to see that the cipher solution was very similar to my refactored 
# solution. The rotate and zip methods were a much more clever way of automating
# the cipher however. It is my hope that the more I become famiiar with these
# methods, the more likely it is that I will come up with simpler solutions like
# this.
