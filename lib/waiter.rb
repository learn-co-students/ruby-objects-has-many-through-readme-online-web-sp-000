require 'pry'

class Waiter
  attr_accessor :name, :yrs_experience
  @@all = []

  def initialize(name, yrs)
    @name = name
    @yrs_experience = yrs
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do | meal |
      meal.waiter == self
    end
  end

  def best_tipper
    highest = 0
    bestTip = nil
    meals.each do | meal |
      if (meal.tip > highest)
        bestTip = nil
        highest = meal.tip
        bestTip = meal.customer
    #    binding.pry
      end
    end
    return bestTip
  end

end
