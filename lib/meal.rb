class Meal
  @@all = []
  attr_reader :name
  attr_accessor :waiter, :customer, :total, :tip
  
  def initialize(waiter_oi, customer_oi, total, tip = 0)
    @waiter = waiter_oi
    @customer = customer_oi
    @total = total
    @tip = tip
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end