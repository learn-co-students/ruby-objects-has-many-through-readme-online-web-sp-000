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

  def new_meal(waiter, total, tip=0)
   Meal.new(waiter, self, total, tip)
 end

 def meals
  Meal.all.select do |meal|
    meal.customer == self
  end
end

end
