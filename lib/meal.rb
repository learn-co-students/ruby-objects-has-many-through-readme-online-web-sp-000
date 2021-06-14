#meal connects the two customer and waiter
#a meal has a customer, and has a waiter.
#a meal has a total and a tip.



class Meal
  @@all = []
  attr_accessor :waiter, :total, :customer, :tip

  def initialize(waiter, customer, total, tip = 0 )
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
