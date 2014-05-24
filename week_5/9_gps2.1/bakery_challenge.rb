# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Andrew Adams
# 2) Justin Lee

# This is the file you should end up editing. 
def bakery_num(num_of_people, fav_food) # Define method bakery_num that inputs number of people (int), and fav food (string)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} # My list initializes new hash. Keys: pie, cake, cookie. Values: 8, 6, 1
  pie_qty = 0 # Qty of each fav food to 0
  cake_qty = 0 # Qty of each fav food to 0
  cookie_qty = 0 # Qty of each fav food to 0
  
  has_fave = false # Set a new variable has fave to false 

  my_list.each_key do |k| # Iterating over just the keys of my list hash
    if k == fav_food # Checks to see if the key is equal to the fav food method
      has_fave = true # If the key is equal to fav food then set has fav to true
      fav_food = k # Sets the fav food to either pie, cake or cookie
    end
  end
  
  if has_fave == false # If has_fave variable is false (favorite food is no passed as argument)
    raise ArgumentError.new("You can't make that food") # Raises an argument error, statement: You cant make that food
  else
    fav_food_qty = my_list.values_at(fav_food)[0] # Setting variable fav_food_quantity to get the value of fav_food in my_list
    if num_of_people % fav_food_qty == 0 # If the number of people divided by the quantity does not have a remainder
      num_of_food = num_of_people / fav_food_qty # Set number of food to number of people divided by favorite food quantity
      return "You need to make #{num_of_food} #{fav_food}(s)." # Returns the string substituting variables with strings
    else num_of_people % fav_food_qty != 0 # If the num of people is not evenly divided by fav food qty
      while num_of_people > 0 # While there are still people remaining who are HUNGRY!!!
        if num_of_people / my_list["pie"] > 0 # If the number of people divided by the number of pies is greater than zero
          pie_qty = num_of_people / my_list["pie"] # Set new pie qty to number of people divided by the number of pies
          num_of_people = num_of_people % my_list["pie"] # The number of people remaining is set to the remainder of the number of people divided by the num of pies
        elsif num_of_people / my_list["cake"] > 0 # If the number of people divided by the number of cake is greater than zero
          cake_qty = num_of_people / my_list["cake"] # Set new pie qty to number of people divided by the number of cakes
          num_of_people = num_of_people % my_list["cake"] # The number of people remaining is set to the remainder of the number of people divided by the num of cakes
        else # If there are people remaining 
          cookie_qty = num_of_people # They each get cookies 
          num_of_people = 0
        end
      end
      return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." # Return string with string interpolation 
    end
  end
end

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!



