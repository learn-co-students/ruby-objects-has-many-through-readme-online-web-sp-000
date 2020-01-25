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

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    customer_meals = []
    Meal.all.each do |meal|
      if meal.customer.name == @name
        customer_meals << meal
      end
    end
    customer_meals
  end

  def waiters
    customer_waiters = []
    meals.each{|meal| customer_waiters << meal.waiter}
    customer_waiters
  end
end 
