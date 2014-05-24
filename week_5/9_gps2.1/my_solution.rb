# U2.W5: Bakery Challenge GPS

# I worked on this challenge with Justin Lee.

# Pseudocode

  # If num of people <= to the fav food qty
    # Return the string "You need to make 1 #{fav_food}."
  # Else 
    # Set fav food = num of people / fav food qty
    # num of people is now equal = num people % fav food qty
    # While num of people > 0
      # If num of people >= pie value 
        # Return pie qty = num of people / pie value
        # num of people is now equal to num people % pie value
      # Elsif num of people >= cake value
        # Set cake qty = num of people / cake value
        # num of people = num of people % cake value
      # Else 
        # Set cookie qty = num of people / cookie value
        # num of people = 0
      # End    
    #  return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." # Return string with string interpolation 
    # End

# Our Refactored Solution

def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  quantities = {"pie" => 0, "cake" => 0, "cookie" => 0}

  has_fave = my_list.include?(fav_food) 
  raise ArgumentError, "You can't make that food." unless has_fave
  
  fav_food_qty = my_list[fav_food]
  
  if num_of_people <= fav_food_qty
    return "You need to make 1 #{fav_food}."
  else
    quantities[fav_food] = num_of_people / fav_food_qty
    num_of_people = num_of_people % fav_food_qty
    while num_of_people > 0
      if num_of_people >= my_list["pie"]
        quantities["pie"] += num_of_people / my_list["pie"]
        num_of_people = num_of_people % my_list["pie"]
      elsif num_of_people >= my_list["cake"]
        quantities["cake"] += num_of_people / my_list["cake"]
        num_of_people = num_of_people % my_list["cake"]
      else
        quantities["cookie"] += num_of_people
        num_of_people = 0
      end
    end
    return "You need to make #{quantities["pie"]} pie(s), #{quantities["cake"]} cake(s), and #{quantities["cookie"]} cookie(s)."
  end  
end


#DRIVER CODE
bakery_num(1, "apple") rescue
puts $!.to_s == "You can't make that food."

puts bakery_num(1, "pie") == "You need to make 1 pie."
puts bakery_num(1, "cake") == "You need to make 1 cake."
puts bakery_num(1, "cookie") == "You need to make 1 cookie."
puts bakery_num(130, "cake") == "You need to make 0 pie(s), 21 cake(s), and 4 cookie(s)."
puts bakery_num(9001, "cookie") == "You need to make 0 pie(s), 0 cake(s), and 9001 cookie(s)."
puts bakery_num(71, "pie") == "You need to make 8 pie(s), 1 cake(s), and 1 cookie(s)."

# Reflection 



