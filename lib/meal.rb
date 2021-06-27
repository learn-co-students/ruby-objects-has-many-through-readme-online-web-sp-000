class Meal
  attr_accessor :waiter, :customer, :tip, :total 
  
  @@all = []
  
  def initialize(waiter, customer, total, tip=0) #initializes with a waiter, a customer, a total, and a tip
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self 
  end
  
  def self.all #is class method that returns the contents of @@all
    @@all 
  end 
end