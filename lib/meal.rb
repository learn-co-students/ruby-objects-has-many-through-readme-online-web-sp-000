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
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
end
