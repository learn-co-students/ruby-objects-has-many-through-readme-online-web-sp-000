require 'pry'

class Customer
  attr_accessor :name, :age, :waiter, :total, :tip, :cutomer, :years, :meal
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
Meal.new(waiter, self, total, tip)
 end
def meals
 Meal.all.select {|meal| meal.customer == self}
 end
#########
 def waiters
   #Waiter.all.select {|waiter|waiter.customer  == self.meal}
meals.map do |meal| meal.waiter end
 end

########
end
