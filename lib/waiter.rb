class Waiter
  attr_accessor :name, :years_of_experience

  @@all = []

  def initialize(name, years_of_experience)
    @name, @years_of_experience = name, years_of_experience
    @@all << self
  end

  def new_meal(customer, total, tip)
    Meal.new(customer, self, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter.name == self.name }
  end

  def best_tipper
    largest_tip = 0
    best_tipping_customer = ""
    meals.select do |meal| 
      if meal.tip > largest_tip
        largest_tip = meal.tip
        best_tipping_customer = meal.customer
      end
    end
    best_tipping_customer
  end

  def self.all
    @@all
  end
end