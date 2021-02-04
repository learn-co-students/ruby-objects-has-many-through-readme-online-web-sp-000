class Waiter
  attr_reader :name, :yrs_experience, :customer

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    @meals = Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    largest_tip = 0
    customer_with_largest_tip = ""
    meals.each do |meal|
      #binding.pry
      if meal.tip > largest_tip
        largest_tip = meal.tip
        customer_with_largest_tip = meal.customer
      end
      #binding.pry
    end
    customer_with_largest_tip
  end


end
