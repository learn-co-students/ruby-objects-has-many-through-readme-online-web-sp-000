class Customer
  attr_accessor :name, :age, :waiter, :total, :tip

  @@all = []

  def initialize (name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

# initializes a meal using the current Customer instance, a provided Waiter instance and a total
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end
  #returns an Array of Meal instances associated with this customer
  def meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def waiters
#returns an Array of Waiter instances associated with this customer's meals
  meals.map {|meal| meal.waiter}
  end

end
