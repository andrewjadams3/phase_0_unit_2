# U2.W6: Refactoring for Code Readability


# I worked on this challenge by myself.


# Original Solution
# class CreditCard
  
#   def initialize(card_number)
#     if card_number.to_s.length == 16
#         @card_number=card_number.to_s.split("")
#     else 
#       raise ArgumentError.new("Must enter 16 numbers")
#     end
#   end
  
#   def even_total
#       even_index_array = @card_number.select.each_with_index { |num, i| i.even? }
#       even_times_two = even_index_array.map {|x| x.to_i*2}
#       even_times_two = even_times_two.map! do |x| 
#         if x > 9 
#             x.to_s.split("")
#         else
#         	x.to_s
#         end
#     end
#     even_times_two_flat = even_times_two.flatten.map! {|x| x.to_i }
#     return even_times_two_flat.inject(:+)
#   end
  
#   def odd_total
#     odd_index_array = @card_number.select.each_with_index { |num, i| i.odd? } 
#     odd_index_array_integers = odd_index_array.map! {|x| x.to_i}
#     return odd_index_array_integers.inject(:+)
#   end
  
#   def check_card
#      @total = even_total + odd_total
#     if @total % 10 == 0 
#       return true
#     else 
#       return false
#   	end
#   end

# end

# Refactored Solution
class CreditCard

	def initialize(card_number)
		@card_number = card_number.to_s.split("").map(&:to_i)
		raise "Card must be 16 digits long" unless @card_number.size == 16
	end

	def check_card
		doubled = (0...16).map {|i| i.even? ? @card_number[i]*2 : @card_number[i]}
		answer = doubled.join.split('').map(&:to_i)
		answer.inject(:+) % 10 == 0
	end

end

# DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Assertion error!" unless yield
end

assert {CreditCard.instance_method(:initialize).arity == 1}
assert {CreditCard.instance_method(:check_card).arity == 0}

real_card = CreditCard.new(4408041234567893)
assert {real_card.check_card == true}

fake_card = CreditCard.new(4408041234567892)
assert {fake_card.check_card == false}


# Reflection 
# I felt like I had refactored my code quite a bit during the first time we 
# worked on this challenge last week, so I borrowed someone elses code to
# refactor this time. I liked the logic, and I simply tried to pare it down to
# the essentials. By doing some more work in the initialize method, some work
# was saved in the check_card method. I was also able to remove helper methods
# by doing their work in one #map. Unfortunately, the code isn't extremely
# readable, but because it is so short, I feel that this isn't an issue.