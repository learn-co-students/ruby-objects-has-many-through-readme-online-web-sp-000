class Waiter
  @@all = []
  attr_reader :name
  attr_accessor :years
  
  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer_oi, total, tip = 0)
    Meal.new(self, customer_oi, total, tip)
  end
  
  def meals
    Meal.all.select {|i| i.waiter == self}
  end
  
  def best_tipper
    best_tipped_meal = self.meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end
  
end