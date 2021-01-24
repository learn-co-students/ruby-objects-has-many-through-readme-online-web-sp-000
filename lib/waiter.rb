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
  end     #created with the waiter's name & experience

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end   #create a meal, using the Class

  def meals
    Meal.all.select do |meal|
      meal.waiter == self #checking for waiter now
    end
  end    #iterating through every instance of meal and returning only those
         #where the meal's waiter is the waiter in question

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end     #using meals, we can order which customers are the best tipper

end
