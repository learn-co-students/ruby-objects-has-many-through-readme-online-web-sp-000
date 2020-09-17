class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end 

  def self.all
    @@all
  end 

  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
  end 

  def meals
    Meal.all.select do |meal|
        meal.customer == self
    end 
  end 

  def waiters
    meals.map do |meal|
    #Refers  to the meals method directly up above
    #And the array that it returned of the customer's meals
        meal.waiter
    end 
  end 
end