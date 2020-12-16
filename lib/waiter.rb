class Waiter
  attr_accessor :years_of_experience
  attr_reader :name

  @@all = []

  def initialize(name,years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    @@all << self
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def new_meal(customer,total,tip)
    Meal.new(self,customer,total,tip)
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a,meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  def self.all
    @@all
  end
end
