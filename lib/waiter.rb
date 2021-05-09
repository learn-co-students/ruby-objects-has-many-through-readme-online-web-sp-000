class Waiter
  attr_accessor :name, :years_experience 
  @@all = []
  
  def initialize(name, years_experience)
    @name = name 
    @years_experience = years_experience 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end 
  
  def meals 
    Meal.all.select {|meal| meal.waiter == self}
  end 
  
  def best_tipper 
    largest_tip = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
    largest_tip.customer
  end 
end