require 'pry'

class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name, @age = name, age
    @@all << self
  end

  def new_meal(waiter, total, tip)
    Meal.new(self, waiter, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer.name == self.name }
  end

  def waiters
    waiter_array = []
    self.meals.each do |meal| 
      waiter_array << meal.waiter if meal.waiter
    end
    waiter_array
  end

  def self.all
    @@all
  end
end