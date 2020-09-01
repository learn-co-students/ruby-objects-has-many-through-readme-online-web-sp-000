class Meal
  
  attr_accessor :waiter, :customer, :total, :tip
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    self.class.all << self
  end

end