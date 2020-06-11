require 'pry'
class Waiter
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
    def meals
        Meal.all.select do |meal|
          meal.waiter == self #checking for waiter now
        end
    end
    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
    end
    def frequent_customer
        hash = {}
        frequent_customer = meals.each do |meal|
            #binding.pry
            if hash[meal.customer] == nil
                hash[meal.customer] = 1
            else 
                hash[meal.customer] += 1
            end
            
            
            #binding.pry
        end
        #binding.pry
        @compareValue = hash.values[0]
        @compare = hash.first
        @compareKey = hash.keys[0]
        hash.each do |key, value|
            #binding.pry
            if @compareValue < hash[key]
                @compare = hash.slice(key)
                
                #binding.pry
            end
        end
    end
end
howard = Customer.new("Howard", 30)
daniel = Customer.new("Daniel", 30)
lisa = Customer.new("Lisa", 27)
josh = Customer.new("Josh", 31)
steven = Customer.new("Steven", 28)
terrance = Waiter.new("Terrance", 1)


howard.new_meal(terrance, 15, 2)
daniel.new_meal(terrance, 15, 4)
daniel.new_meal(terrance, 20, 4)
daniel.new_meal(terrance, 25, 4)
lisa.new_meal(terrance, 15, 5)
lisa.new_meal(terrance, 20, 5)
josh.new_meal(terrance, 15, 1)
steven.new_meal(terrance, 15, 3)
terrance.frequent_customer