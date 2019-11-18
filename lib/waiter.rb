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
    Meal.all.select { |meal| meal.waiter == self }
  end
  
  def best_tipper
    tip = Meal.all.max_by { |meal| meal.tip }
    
    tip.customer
    
  end

end