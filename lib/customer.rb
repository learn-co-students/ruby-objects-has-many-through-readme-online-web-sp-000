class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end   #created with the customer's name & age

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end    #create a meal, using the Class

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end   #iterating through every instance of meal and returning only those
        #where the meal's customer is the customer in question

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end
  #iterate through customer's meals to retrieve information about waiters

end
