class Waiter

  @@all = []

  def initialize(name, years)
    @name = name
    @years = years

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
    Meal.all.select {|m| m.waiter == self}
  end

  def best_tipper

    all_meals = self.meals

    best_tip = all_meals[0].tip
    best_tipper = all_meals[0].customer

    all_meals.each do |meal|
      if meal.tip > best_tip
        best_tipper = meal.customer
        best_tip = meal.tip
      end
    end
    best_tipper
  end
end
