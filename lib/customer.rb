#a customer

class Customer
  attr_accessor :name, :age
  @@all = []


#neccasary establishing of inputs and readability
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end

    def self.all
      @@all
    end


#A Customer would: (the following are real world methods)
#Sit down to have a new meal : invokes a new meal method, and passes in the info
    def new_meal(waiter, total, tip=0)
      Meal.new(waiter, self, total, tip)
    end


#What are all the meals a specific cusotmer has had, looks inside meals for
#instances of meal.customer which match the current customer
    def meals
      Meal.all.select do |meal|
        meal.customer == self
      end
    end


#calls .waiter on meals to match a customer to the meals to the waiter and puts
#and puts meal.waiter on each. 
    def waiters
      meals.map do |meal|
        meal.waiter
      end
    end

end
