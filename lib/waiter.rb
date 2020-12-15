class Waiter
  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |a, b|
      a.tip <=> b.tip
    end.customer
  end
end
