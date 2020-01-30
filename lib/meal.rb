class Meal

    attr_accessor :waiter, :customer, :total, :tip

    @@all = []

    def initialize(waiter, customer, total, tip)
        @waiter = waiter 
        @customer = customer 
        @total = total 
        @tip = tip 
        @@all << self
    end

    def self.all
        @@all
    end

    



end

# a = Meal.new(niky, ian, 50, 3)
# b = Meal.new(niky, ian, 30, 3)
# c = Meal.new(niky, ian, 20, 3)

