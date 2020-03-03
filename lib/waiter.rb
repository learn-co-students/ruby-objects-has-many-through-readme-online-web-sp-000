require 'pry'
class Waiter
  attr_accessor :name, :experience, :customers

  @@all = [].uniq

  def initialize (name, experience)
  @name = name
  @experience = experience
  @meals = []
  @@all << self
  end

  def new_meal(customer, total, tip)
  meal = Meal.new(self, customer, total, tip)
  end

  def meals
  @meals
  end

def best_tipper
self.meals.sort {|a,b| a.tip <=> b.tip}[-1].customer
end

  def self.all
  @@all
  end

end
