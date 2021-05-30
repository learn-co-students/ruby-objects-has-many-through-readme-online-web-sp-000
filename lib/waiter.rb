class Waiter
    # has many meals, has many customers through meals
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals #way to access all the meals the waiter has served
        Meal.all.select do |meal|
          meal.waiter == self #checking for  current waiter
        end
    end

    def best_tipper #sort customer tips from highest to lowest
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip #gets the highest tip
        end
       
        best_tipped_meal.customer #associates the tip with the customer and returns that customer
    end

end