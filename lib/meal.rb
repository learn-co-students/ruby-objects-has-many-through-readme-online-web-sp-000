class Meal
  attr_accessor :waiter, :customer, :total, :tip
  @@all = []

  def initialize(waiter, customer, total, tip=0)
    @waiter, @customer, @total, @tip = waiter, customer, total, tip
    @@all << self
  end

  def self.all
    @@all
  end
end
