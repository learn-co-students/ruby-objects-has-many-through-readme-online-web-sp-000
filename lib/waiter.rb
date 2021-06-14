#a waiter


class Waiter
  attr_reader :name
  attr_accessor :experience

  @@all = []

    def initialize(name, experience)
      @name = name
      @experience = experience
      @@all << self
    end

    def self.all
      @@all
    end


#starting a new meal from this end instead
    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end


#same, but for a waiter
    def meals
      Meal.all.select do |meal|
        meal.waiter == self
      end
    end

#compares tips from meals by searching over the meals array for the maximum value
#returns the customer of that meal
    def best_tipper
      best_tipped_meal = meals.max do |meal_a, meal_b|
        meal_a.tip <=> meal_b.tip
      end
      best_tipped_meal.customer
    end

end
