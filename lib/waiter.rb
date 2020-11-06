class Waiter
  
  attr_accessor :name, :experience
  
  @@all = [ ]
  
  def initialize(name, experience)
    @name =  name
    @experience = experience
    @@all << self
  end
  
  def new
    @name
    @experience
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip)
    waiter = self
    meal = Meal.new(waiter, customer, total, tip)
  end
  
  def meals
    waiter_meals = [ ]
    Meal.all.collect do |meal|
      if meal.waiter.name == self.name
        waiter_meals << meal
      end
    end
    waiter_meals
  end
  
  def best_tipper
    best = Meal.all.max_by { |meal| meal.tip}
    best.customer
  end

end