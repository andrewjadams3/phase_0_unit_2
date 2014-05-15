# U2.W4: Cipher Challenge

# I worked on this challenge with Marek.

# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.

def north_korean_cipher_initial(coded_message)
  input = coded_message.downcase.split("") # Turning every letter into a lower case letter and then splitting it into array
  decoded_sentence = []  
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",   # An array would be better structure, we can automate the shifting of the letters
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # iterating over each input character
    found_match = false  #when false the same character will be added to the solution
    cipher.each_key do |y| # iterating through the keys of cipher hash
      if x == y  #if current character is equal to a hash key
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  #it will end the loop once it finds its match
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #If it matches one of these characters it will add a space
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # turns a range into an array and then checks if that array includes the input
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  #If there is no match then add the character to the solution
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #Finding all the digits 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #Replace and divide by 100
  end  
  return decoded_sentence # it's returning the string   
end

# Your Refactored Solution
def shift_letter(number, letter)
  alphabet = ("a".."z").to_a
  index = alphabet.index(letter)
  index.between?(0, number-1) ? alphabet[index+(26-number)] : alphabet[index-number]
end

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("")
  decoded_sentence = ""    
  input.each do |x|
    if ("a".."z").include?(x)
      decoded_sentence << shift_letter(4,x)
    elsif x.match(/[\@\#\$\%\^\&\*]/)
      decoded_sentence << " "
    else
      decoded_sentence << x
    end
  end
  decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 }
  decoded_sentence
end


# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"

# Reflection
# This was a great challenge to work on with a partner! There were a lot of 
# small parts of the code to catch that could easily slip by just one person.
# I found it very satisfying to come up with a way to automate the cipher. My 
# partner even had the idea of modifying o`ur method to work for any number of 
# shifts (not just a shift of four letters) which I thought was very clever. I
# doubt I would have thought to do that on my own.

# I enjoyed refactoring the code piece by piece after we had come up with our
# automation. we came up with code that was extremely condensed compared to the
# initial solution. After my parter and I ended our session, I just wanted to 
# keep going, and I kept trimming code until I reached a point of diminishing
# returns.

# Working with regular expressions was beneficial. Although I have studied them
# before, it is always difficult for me to remember how to implement them
# properly.