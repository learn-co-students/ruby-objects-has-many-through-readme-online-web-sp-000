require 'pry'

class Customer
   attr_accessor :name, :age
 
  @@all = []
 
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
  def self.all 
    @@all
  end
  
  
  def new_meal(waiter, total, tip=0)
    all_meals = []
    binding.pry 
    Meal.new(self, total, tip)
    all_meals << @name.meal
end 

def meals(name)
end 
end 