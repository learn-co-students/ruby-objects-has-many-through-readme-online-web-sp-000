require 'pry'

class Meal
  attr_accessor :waiter, :customer, :total, :tip
 
  @@all = []
 
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
  
  def self.all 
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
    # we don't need to take customer in as an argument, because we're passing in self as a reference
  end
  
  def meals
    Meal.new(name, self, total, tip)
    meal.all = []
    meals.collect |tip| 
     meal.all << tip 
    sorted_tips = meal.all.sort 
    sorted_tips.pop
  end 
    
  
  def best_tipper
    customer
end
end 