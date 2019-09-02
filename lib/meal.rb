class Meal

  attr_accessor :waiter, :customer, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end

  def self.all
    @@all
  end

  def meals #In plain English, the customer is going to
    # look at all of the meals, and then select
    # only the ones that belong to them. Translated into code,
    # that could be written like the following:
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
