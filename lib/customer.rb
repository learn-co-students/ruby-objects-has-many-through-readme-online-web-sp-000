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
    Meal.new(waiter, self, total, tip) # self, here, is the customer
  end

  def meals #calls all the meals ordered by the current customer
    Meal.all.select do |meal|
      meal.customer == self # self = current customer object
    end
  end

  def waiters
    meals.map do |meal| # uses #meals, above to find the waiters
                        # associated with that customer's (self) meals
      meal.waiter
    end
  end

end
