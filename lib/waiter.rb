require_relative "customer.rb"
require_relative "meal.rb"

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

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipping_customer_meal = self.meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipping_customer_meal.customer
  end



  def most_frequent_customer
    customer_occurences = {}
    self.meals.each do |meal|
      if customer_occurences.has_key?(meal.customer.name)
        occurenes = customer_occurences[meal.customer.name]
        occurenes += 1
        customer_occurences[meal.customer.name] = occurenes
      else
        customer_occurences[meal.customer.name] = 1
      end
    end
    puts "Got here"
    occurences = 0
    customer_occurences.each do |key, value|
      if occurences < customer_occurences[key]
        occurences = customer_occurences[key]
      end
    end
    puts "Got here 1"
    final_customer_occurences = customer_occurences.select do |key, value|
      value == occurences
    end
    puts "Got here 2"
    final_most_frequent_customer = Customer.all.find do |customer|
     customer.name = final_customer_occurences.keys.first
    end

    puts "Got here 3"

    final_most_frequent_customer
  end

  def meal_with_lowest_tip
    lowest_tip = self.find_lowest_tip
    lowest_tip_meal = self.meals.find do |meal|
      meal.tip == lowest_tip
    end
    lowest_tip_meal
  end

  def find_lowest_tip
    lowest_tip = 1000
    self.meals.each do |meal|
      if lowest_tip > meal.tip
        lowest_tip = meal.tip
      end
    end
    lowest_tip
  end

  def self.most_experienced_waiter
    Waiter.all.find.max do |waiter_a, waiter_b|
      waiter_a.yrs_experience <=> waiter_b.yrs_experience
    end
  end

  def self.least_experienced_waiter
    Waiter.all.find.min do |waiter_a, waiter_b|
      waiter_a.yrs_experience <=> waiter_b.yrs_experience
    end
  end

  def self.average_tip_for_most_experienced_waiter
    tip_sum = 0
    Waiter.most_experienced_waiter.meals.each do |meal|
      tip_sum += meal.tip
    end
    tip_sum/Waiter.most_experienced_waiter.meals.size
  end

  def self.average_tip_for_least_experienced_waiter
    tip_sum = 0
    Waiter.least_experienced_waiter.meals.each do |meal|
      tip_sum += meal.tip
    end
    tip_sum/Waiter.least_experienced_waiter.meals.size
  end

end


  howard = Customer.new("Howard", 30)
  daniel = Customer.new("Daniel", 30)
  lisa = Customer.new("Howard", 27)
  josh = Customer.new("Josh", 31)
  steven = Customer.new("Steven", 28)
  terrance = Waiter.new("Terrance", 1)

  howard.new_meal(terrance, 15, 2)
  daniel.new_meal(terrance, 15, 4)
  lisa.new_meal(terrance, 15, 5)
  josh.new_meal(terrance, 15, 1)
  steven.new_meal(terrance, 15, 3)

  puts terrance.most_frequent_customer.name
  puts terrance.meal_with_lowest_tip.customer.name

  puts Waiter.average_tip_for_most_experienced_waiter
  puts Waiter.average_tip_for_least_experienced_waiter
