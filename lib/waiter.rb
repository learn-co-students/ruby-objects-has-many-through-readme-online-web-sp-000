class Waiter
  
  attr_accessor :name, :year
  
  @@all = []
  
  def initialize(name, year)
    @name = name 
    @year = year
    @@all << self 
  end 

  def self.all 
    @@all 
  end 
  
  def new_meal(customer, total, tip)
    Meal.new(customer, self, total, tip)
  end 
  
  def meals 
    meals = []
    Meal.all.each do |meal| 
      if meal.waiter == self
        meals << meal 
      end 
    end 
    meals 
  end 
  
  def best_tipper
    meal = Meal.all.max {|a,b| a.tip <=> b.tip}
    meal.customer
  end 
end