require "pry"
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
    
  def new_meal(a_waiter, a_total, a_tip)
    Meal.new(a_waiter, self, a_total, a_tip)
  end
  
  def meals
    meals_arr = []
    Meal.all.each do |d_meal|
      if d_meal.customer.name == self.name
        meals_arr << d_meal
      end
    end
    meals_arr
  end
    
  def waiters
    waiters_arr = []
    Waiter.all.each do |d_waiter|
      meals.each do |d_meal|
        if d_waiter.name == d_meal.waiter.name
          waiters_arr << d_waiter
        end 
      end
    end
    waiters_arr
  end
  
  
end