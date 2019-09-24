class Customer
  @@all = []
  attr_reader :name
  attr_accessor :age
  
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(waiter_oi, total, tip = 0)
    Meal.new(waiter_oi, self, total, tip)
  end
    
  def meals
    Meal.all.select {|i| i.customer == self}
  end
  
  def waiters
    self.meals.map {|i| i.waiter}
  end
  
end