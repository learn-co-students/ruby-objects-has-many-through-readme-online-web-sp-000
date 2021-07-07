require "pry"
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
    Meal.new(self, customer, total,tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end

  def worst_tipper
    worst_tipper = meals.min do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    worst_tipper.customer
  end

  def most_frequent_customer
      names = {}
      meals.each do |meal|
        if names[meal.customer.name]
          names[meal.customer.name] +=1
        else
          names[meal.customer.name] = 1
        end
      end
      max= names.max_by{|k,v| v}[0]
      most_frequent_customer = meals.each do |meal|
        if meal.customer.name == max
          return meal.customer
        end
      end

  end

  def average_tip
    tips = []
    num_of_meals= 0
    combined_tips = 0
    average_tip = 0
    meals.each  do |meal|
      num_of_meals += 1
      tips << meal.tip
    end
        tips.each do |tip|
        combined_tips += tip
        end
    average_tip = combined_tips/num_of_meals
  end
end
#end
