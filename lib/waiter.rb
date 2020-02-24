class Waiter 
  
  attr_accessor :name, :exp, :meals, :customers, :tips  
  
  @@all = []
  
  def initialize(name, exp)
    @name = name
    @exp = exp 
    @meals = []
    @customers = []
    @tips = []
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def new_meal(customer,total,tip)
    Meal.new(self,customer,total,tip)
  end 
  
  def meals
    @meals
  end 
  
  def customers
    @customers
  end 
  
  def tips
    @tips 
  end 
  
  def best_tipper
    @meals.filter{|meal| meal.tip == self.tips.max}[0].customer 
  end 
  
end