class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @aga = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals #returns customer's meal ojbects
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def waiters #returns all the waiter objects from customer's meal ojbects
    meals.collect do |meal|
      meal.waiter
    end
  end

end
