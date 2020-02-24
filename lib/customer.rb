class Customer
  
  attr_accessor :name, :age, :meals, :waiters 
  
  @@all = []
  
  def initialize(name, age)
    @name = name
    @age = age 
    @meals = []
    @waiters = []
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def new_meal(waiter, total, tip)
    Meal.new(waiter,self,total,tip)
  end 
  
  def meals
    @meals
  end 
  
  def waiters
    @waiters 
  end 
  
end