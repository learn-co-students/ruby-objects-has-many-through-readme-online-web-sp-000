require 'pry'

#added tip_count to customer class to keep track of total amount of tips left by customer 

class Customer
  attr_accessor :all, :name, :age, :tip_count
  
  @@all = []
  
  def initialize(customer_name, age)
    @name = customer_name
    @age = age
    @@all << self
    @all_meals = []
    @all_waiters = []
    @tip_count = 0
  end 
  
  def self.all 
    @@all
  end 
  
  def new_meal(a, b, tip)
    meal = Meal.new(a, self, b, tip)
    @all_waiters << meal.waiter
    @all_meals << meal
    @tip_count = @tip_count + tip
  end
 
  def meals 
   @all_meals
  end
  
  def waiters 
    @all_waiters
  end 
  
end