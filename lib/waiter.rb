class Waiter
  
  attr_accessor :name, :yrs_experience
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    self.class.all << self
  end
  
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end
  
  def customers
    Meal.all.map {|meal| meal.customer}
  end
  
  def best_tipper
    meals.sort_by {|meal| meal.tip}.pop.customer
  end

end