class Meal
  attr_accessor :waiter, :customer, :total, :tip

  @@all = [].uniq

  def initialize (waiter, customer, total, tip)
  @waiter = waiter
  @customer = customer
  @total = total
  @tip = tip
  @@all << self
  customer.meals << self
  customer.waiters << waiter
  waiter.meals << self
  end

  def self.all
  @@all
  end

end
