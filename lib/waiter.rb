class Waiter
  attr_accessor :name, :age, :customer, :total, :tip, :waiter, :years, :meal
  @@all = []
def initialize(name, years)
  @name = name
  @years = years
  @@all << self
end
def self.all
  @@all
end
 def new_meal(customer, total, tip)
  Meal.new(self, customer, total, tip)
 end
 def meals
  Meal.all.select do |meal| meal.waiter == self
   end
end
#####
def best_tipper
 #Customer.all.max {|a,b| a.attr <=> b.attr }
 best_tipped_meal = meals.max do |meal_a, meal_b| meal_a.tip <=> meal_b.tip end

best_tipped_meal.customer
end
end
