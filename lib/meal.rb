class Meal
  
  attr_accessor :waiter, :customer, :total, :tip  
  
  @@all = []
  
  def initialize(waiter, customer, total, tip)
    @waiter = waiter
    @customer = customer 
    @total = total 
    @tip = tip 
    customer.meals << self 
    customer.waiters << waiter 
    waiter.meals << self 
    waiter.customers << customer 
    waiter.tips << tip 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
end