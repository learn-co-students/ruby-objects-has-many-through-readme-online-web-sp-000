class Customer
  attr_accessor :name, :age 
  
  # By storing all Customer's instance, the class knows about every customer that gets created
  # @@all is where the instances are stored
  @@all = []
  
  # When creating a new instance, it is sent to the @@all class variable
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
 # This class method allow Customer to tell what are its customer instances
  def self.all
    @@all
  end
  
  def meals
      Meal.all.select do |meal|
        meal.customer == self
      end
  end
   
  def waiters
      meals.map do |meal|
        meal.waiter
      end
  end
   
  def new_meal(waiter, total, tip=0)
      Meal.new(waiter, self, total, tip)
  end
   
  def new_meal_20_percent(waiter, total)
      tip = total * 0.2
      Meal.new(waiter, self, total, tip)
  end
   
  def self.oldest_customer
      oldest_age = 0
      oldest_customer = nil
      self.all.each do |customer|
        if customer.age > oldest_age
          oldest_age = customer.age
          oldest_customer = customer
        end
      end
    oldest_customer
  end
  
  
end