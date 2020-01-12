class Customer

  # Their name and age are set upon initialization,
  # and because we created an attribute accessor for both, the customer can change their name or age
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

  # As you can see, we don't need to take customer in as an argument,
  # because we're passing in self as a reference to the current instance of customer.
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  # We're iterating through every instance of Meal and returning
  # only the ones where the meal's customer matches the current customer instance.
  def meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def waiters
    meals.map { |meal| meal.waiter }
  end

end
