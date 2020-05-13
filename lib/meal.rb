class Meal
attr_accessor :waiter, :customer, :total, :tip

  @@all = []
  
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
  
  def meals
    Meal.all.select.do |meal|
      meal.customer == self 
    end
    
  def self.all
    @@all 
  end
  
end