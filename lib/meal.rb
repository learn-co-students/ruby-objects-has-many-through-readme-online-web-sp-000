class Meal
  attr_accessor :waiter, :customer, :total, :tip

#To obey the single source of truth, we're going to tell the Meal class to know all the details of each meal instance. 
#That includes not only the total cost and the tip (which defaults to 0) but also who the customer and waiter were for each meal.
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end
#^^^gives both the customer and waiter instances the ability to get all the info about the meal that they need
#without having to store it themselves.
  def self.all
    @@all
  end

end
