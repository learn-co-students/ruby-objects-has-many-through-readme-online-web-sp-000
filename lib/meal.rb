class Meal
  attr_accessor :customer, :waiter, :total, :tip

  @@all = []

  def initialize(customer, waiter, total, tip)
    @customer, @waiter, @total, @tip = customer, waiter, total, tip
    @@all << self
  end

  def self.all
    @@all
  end
end