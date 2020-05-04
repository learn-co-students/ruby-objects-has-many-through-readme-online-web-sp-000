class Meal
  attr_accessor :waiter, :customer, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tips)
    @waiter = waiter
    @customer = customer
    @total = total
    @tips = tips
    @@all << self
  end

  def self.all
    @@all
  end

end
