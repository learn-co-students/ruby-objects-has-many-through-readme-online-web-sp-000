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
        Meal.all.select do |meal|
            meal.customer == self
        end
    end
    #returns all meal instances associated with a customer

    def waiters
        meals.map do |meal|
            meal.waiter 
        end
    end
    # returns waiter instances associated with a customer




end