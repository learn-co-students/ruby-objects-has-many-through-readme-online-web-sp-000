class Customer
  
  attr_accessor :name, :age, :waiter
  
  @@all = [ ]
  
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
  
  def new
    @name
    @age
  end
  
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip)
    customer = self
    meal = Meal.new(waiter, customer, total, tip)
  end
  
  def meals
    customer_meals = [ ]
    customer_name = self.name
    Meal.all.collect do |meal|
      if meal.customer.name == customer_name
        customer_meals << meal
      end
    end
    customer_meals
  end
    
  def waiters
    customer = self
    customer.meals.collect do |customer_meal|
      customer_meal.waiter
    end
  end
  
end