class Customer
  #name and age are set upon initialization - because this is an attr_accesor, the customer can change thier name and age
  attr_accessor :name, :age 
  @@all = []
  
  def initialize(name,age)
    @name = name
    @age = age
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  #customer can create a meal - take in an instance of a waiter and supply the total and tip, defaulted as 0
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter,self,total,tip)
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
  
  
  
end