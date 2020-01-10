class Meal
attr_accessor :waiter, :customer, :tip, :total 
@@all = []
def initialize(waiter, customer, total, tip = 0)
  @tip = tip 
  @waiter = waiter
  @customer = customer 
  @total = total 
  @@all << self 
end 


def self.all 
  @@all 
end 
end