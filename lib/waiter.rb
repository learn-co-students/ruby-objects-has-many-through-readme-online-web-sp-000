class Waiter
    attr_accessor :all, :customer
  
  @@all 
  
  def initialize(customer_name, age)
    @name = customer_name
    @years = age
    @@all << self
    @all_customers = []
    @all_meals = []
  end 
  
  def self.all 
    @@all
  end 
  
  def new_meal(a, b, tip)
    meal = Meal.new(self, a, b, tip)
    @all_customers << meal.customer
    @all_meals << meal
  end
  
  def meals 
   Meal.all.select do | meal |
     meal.waiter == self
   end 
  end
  
 def best_tipper 
    highscore = 0.0
    best_tip = nil
    Meal.all.each do | meal |
      if meal.customer.tip_count > highscore
        highscore = meal.customer.tip_count
        best_tip = meal 
      else
        highscore = highscore
        best_tip = best_tip
      end
    end 
    best_tip.customer
  end 
  
end