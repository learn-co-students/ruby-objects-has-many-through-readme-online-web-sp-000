class Waiter
  attr_accessor :name, :yrs_experience
  
  @@all = []
  
  def initialize(name, years)
    @name= name
    @yrs_experience = years
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer,total,tip = 0)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select { |meal| meal.waiter == self}
  end
  
  def customers
    meals.map { |meal| meal.customer }
  end
  
  def best_tipper
    best_tip = 0.0
    best_customer  = nil
    meals.each do |meal|
      if meal.tip > best_tip
        best_tip = meal.tip
        best_customer = meal.customer
      end
    end
    best_customer
  end

end