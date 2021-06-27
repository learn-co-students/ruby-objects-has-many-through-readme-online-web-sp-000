class Customer
  attr_accessor :name, :age 
  
  @@all = []
  
  def initialize(name, age) #initializes with a name and age
    @name = name
    @age = age
    @@all << self
  end
  
  def self.all #is class method that returns contents of @@all
    @@all
  end
  
  def new_meal (waiter, total, tip=0)
    #initializes a meal using the current Customer instance, a provided Waiterinstance and a total and tip
    Meal.new(waiter, self, total, tip)
  end
  
  def meals #returns an Array of Meal instances associated with this customer
    Meal.all.select do |meal|
      meal.customer == self 
    end
  end
  
  def waiters #returns an Array of Waiter instances associated with this customer's meal
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