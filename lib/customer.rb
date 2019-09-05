require 'pry'
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
  
  def new_meal(waiter, total, tip)
    Meal.new(self, waiter, total, tip)
  end 
  
  def meals 
    meals = []
    Meal.all.each do |meal| 
      if meal.customer == self
        meals << meal 
      end 
    end 
    meals 
  end 
  
  def waiters 
    waiters = []
    Meal.all.each do |meal| 
      if meal.customer == self
        waiters << meal.waiter 
      end 
    end 
    waiters
  end 
  
end