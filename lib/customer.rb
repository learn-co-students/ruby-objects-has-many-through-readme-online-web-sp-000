class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name=name
    @age=age
    @@all<<self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select do |meal|#we are iterating through every instance of the Meal and rturning only the ones where the meal's customer matches the current customer instance.
      meal.customer==self
    end
  end#customer is going to look at all the meals and then select only the ones that belong to them

  def waiters
    meals.collect do |meal|
      meal.waiter
    end
  end
end
