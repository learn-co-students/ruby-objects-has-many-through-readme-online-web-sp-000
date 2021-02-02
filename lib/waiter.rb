class Waiter

  attr_accessor :name, :years_experience
 
  @@all = []
 
  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
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
      meal.waiter == self
    end
  end

  def best_tipper
    best_customer = nil
    best_tip = 0
    best_meal = Meal.all.select do |meal|
      if meal.tip > best_tip
        best_tip = meal.tip
        best_customer = meal.customer
       end
    end
    return best_customer
  end

end