class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
  #def new_meal method follows same pattern as new_meal method for 'customer', however the parameters are different
  #parameters are different for the new_meal method for 'customer' and 'waiter', but the order of arguments for Meal.new() remains
  #the same - a waiter, a customer, a total, and a tip. (Got a weird error when I switched 'self' & 'customer' in method.. not sure why?)
  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end
end
