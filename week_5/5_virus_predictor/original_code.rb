# U2.W5: Virus Predictor

# I worked on this challenge with Spencer Zhang.

# EXPLANATION OF require_relative
# 'require-relative' imports ruby code from another file.
# Unlike 'require', which looks in the system's PATH folders, 'require-relative'
# looks in the same directory as the working file.
require_relative 'state_data'

class VirusPredictor
  # Constructor for the class. Takes as input a state of origin, population
  # density, population, region, and regional spread. It saves these inputs as
  # instance variables in the class.
  def initialize(state_of_origin)
    @state = state_of_origin
    @population = STATE_DATA[@state][:population]
    @population_density = STATE_DATA[@state][:population_density]
    @region = STATE_DATA[@state][:region]
    @next_region = STATE_DATA[@state][:regional_spread]
  end

  # This is a public instance method. It is an aggregator for the private 
  # methods that calculate predicted deaths and the speed of spread.
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    print "#{@state} will lose #{predicted_deaths} people in this outbreak"
    puts " and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private #Everything written underneath is only accessible by the same instance

  # Returns the predicted number of deaths in a given state, based on the
  # state's population density and the total population.
  # The greater the density, the higher the death rate.
  def predicted_deaths
    case(@population_density)
        when(0...50)    then(number_of_deaths = (@population * 0.05).floor)
        when(50...100)  then(number_of_deaths = (@population * 0.1).floor)
        when(100...150) then(number_of_deaths = (@population * 0.2).floor)
        when(150...200) then(number_of_deaths = (@population * 0.3).floor)
    else                     number_of_deaths = (@population * 0.4).floor
    end
      
    number_of_deaths
      
  end
  
  # Takes the population density and the state and calculates how many months it
  # would take for the virus to spread through the state.
  
  def speed_of_spread
    case @population_density
      when(0...50)    then speed = 2.5
      when(50...100)  then speed = 2
      when(100...150) then speed = 1.5
      when(150...200) then speed = 1
      else                 speed = 0.5
    end
    
    speed
    
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |k, v|
  VirusPredictor.new(k).virus_effects
end