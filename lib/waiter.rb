class Waiter
  @@all = []
  attr_accessor :name, :experience
  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.find_all {|meal| meal.waiter == self}
  end

  def best_tipper
    orders = meals
    order = orders.max do |max, order|
      max.tip <=> order.tip
    end
    order.customer
  end
end
