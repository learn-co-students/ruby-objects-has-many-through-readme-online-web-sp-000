#the meal class knows all the details of each meal instance.
#the meal class joins the customer and waiter class. 
class Meal
  attr_accessor :waiter, :customer, :total, :tip

  @@all = [ ] #creates a new array that can be returned with contents

def initialize(waiter, customer, total, tip)
  @waiter = waiter
  @customer = customer
  @total = total
  @tip = tip
  @@all << self
end

def self.all #is a class method that returns the contents of @@all array
  @@all
end

end
