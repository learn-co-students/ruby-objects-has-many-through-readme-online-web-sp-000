require 'pry'
class Waiter
    @@all = []

    attr_accessor :name, :yrs_of_exp
    def initialize(name, yrs_of_exp)
        @name = name 
        @yrs_of_exp = yrs_of_exp
        @@all << self
    end

    def self.all
        @@all 
    end 

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals 
        Meal.all.select{|meals| meals.waiter == self }
    end 

    def best_tipper
        meals.sort_by{|meal| meal.tip}.last.customer
    end 
end