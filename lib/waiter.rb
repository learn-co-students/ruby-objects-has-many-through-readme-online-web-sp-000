class Waiter
  attr_accessor :name, :years
  
  @@all = [] 
  
  def initialize(name, years)
    @name = name 
    @years = years
    self.class.all << self 
  end 

  def self.all 
    @@all 
  end 
  
  def new_meal(customer, total, tip)
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