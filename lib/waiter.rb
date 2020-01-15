class Waiter
    attr_accessor :name, :years_of_experience
    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        
        meals.reduce { |meal_biggest_tip, meal|
            meal_biggest_tip.tip > meal.tip ? meal_biggest_tip : meal
        }.customer

    end

end