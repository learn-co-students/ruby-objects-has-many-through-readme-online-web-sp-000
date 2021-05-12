class Customer
    
    attr_accessor :name, :age

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, age)
        @name, @age = name, age
        @@all << self
    end

    def new_meal(waiter, total, tip = 0)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        self.meals.map {|meal|meal.waiter}
    end

end