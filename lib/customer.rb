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
  #def new_meal gives customer the ability to create a meal, and automatically associate each new meal with the customer that created it.
  #Takes in an instance of a waiter and supply the total and tip, which we defaulted to 0 here as well
  #we don't need to take 'customer' in as an argument, because we're passing in 'self'as a reference to
  #the current instance of 'customer'
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
  #to establish the 'has-many-through' relationship, we need a way for our 'customer' and 'waiter'instances to get info about each other.
  #only way they can get that info is through the meals they've created.
  #^^^ iterating through every instance of 'Meal'and returning only the ones where the meal's customer matches
  #the current 'customer' instance.
  #Eg: If a customer, Rachel, wants to know about all of her meals, all we need to do is call the #meals method on the 'Customer' instance.
  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

end
