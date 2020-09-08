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

 def new_meal(customer, total, tip = 0)
   Meal.new(self, customer, total, tip)
 end

 def meals
   Meal.all.select {|meal| meal.waiter == self}
 end

 def best_tipper    #create new variable to hold logic of finding highest tip num
   best_tipped_meal = meals.max do |meal_a, meal_b| #compare highest nums
     meal_a.tip <=> meal_b.tip                      #compare tip attr and rank
   end
   best_tipped_meal.customer             #return customer attr of new variable
 end
end
