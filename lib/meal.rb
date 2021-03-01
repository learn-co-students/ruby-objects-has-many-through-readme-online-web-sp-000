class Meal

  attr_accessor :customer, :waiter, :tip

  @@all = []


  def initialize(waiter, customer, total, tip)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip

    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
