class Customer
    attr_accessor :name, :age, :meals, :waiters

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
        @meals = []
        @waiters = []
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
        @meals << meal
        @waiters << waiter
        meal
    end

end