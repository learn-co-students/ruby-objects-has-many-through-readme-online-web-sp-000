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

  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer.name == self.name }
  end

  def waiters
    waiters_list = []
    Meal.all.each do |meal|
      waiters_list << meal.waiter if meal.customer.name == self.name
    end
    waiters_list
  end
end
