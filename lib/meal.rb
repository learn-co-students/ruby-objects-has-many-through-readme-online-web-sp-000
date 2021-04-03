# ./lib/meal.rb
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
  
   def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
 
  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end
end