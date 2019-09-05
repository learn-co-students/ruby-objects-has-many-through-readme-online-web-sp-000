require 'pry'
class Meal
  
  @@all = []
  
  attr_accessor :customer, :waiter, :total, :tip

  def initialize(customer, waiter, total, tip)
    @customer = customer
    @waiter = waiter
    @total = total
    @tip = tip
    @@all << self
  end
  
  def self.all 
    @@all 
  end 
  
 

end