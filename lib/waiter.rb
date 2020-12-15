class Waiter
  attr_accessor :name, :xp

  @@all = []

  def initialize(name, xp)
    @name = name
    @xp = xp
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    best_tip = meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }
    best_tip.customer
  end
end
