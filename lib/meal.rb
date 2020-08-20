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



  def self.all
    @@all
  end


end

#meal is the middle man, the central hub, that connects waiter and customers
#all meals is stored in here. one single source of truth. custoemrs and waiters DO NOT HAVE A COPY of their meals served/eaten
#they have methods that can ACCESS the meals served/eaten only. but the source theyre' accessing is from the MEAL class
#either the customer or the waiter can cretea a new meal and enter their waiter or customer respectively
