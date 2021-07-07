class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter.name == self.name }
  end

  def best_tipper
    bestTipMeal = Meal.all.first
    Meal.all.each do |meal|
      bestTipMeal = meal if meal.tip > bestTipMeal.tip
    end
    bestTipMeal.customer
  end
end
