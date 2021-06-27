class Waiter
  attr_accessor :name, :yrs_experience
  
  @@all = []
  
  def initialize (name, yrs_experience) #initializes with a name and years of experience
    @name = name
    @yrs_experience = yrs_experience
    @@all << self 
  end
  
  def self.all #is class method that returns the contents of @@all
    @@all 
  end
  
  def new_meal(customer, total, tip=0) #initializes a meal using the current Waiter instance, a provided Customerinstance and a total and tip
    Meal.new(self, customer, total, tip)
  end
  
  def meals # returns an Array of Meal instances associated with this waiter
    Meal.all.select do |meal|
      meal.waiter == self 
    end
  end
  
  def best_tipper #returns the Customer instance associated with the meal that received the largest tip
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip 
    end 
    
    best_tipped_meal.customer
  end
end