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
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  def most_frequent_customer
    if self.has_served_a_meal?
      customer_array = self.meals.collect{|meal| meal.customer}
      most_frequent_customer = customer_array.max_by{|customer| customer_array.count(customer)}
      most_frequent_customer.name
    else
      "You have not served any meals yet."
    end
  end

  def worst_tipped_meal
    if self.has_served_a_meal?
      self.meals.sort{|a,b| a.tip <=> b.tip}[0]
    else
      "You have not served any meals yet."
    end
  end

  def self.most_and_least_averages
    experience_array = self.all.sort{|a,b| a.yrs_experience <=> b.yrs_experience}
    least_exp = experience_array[0]
    most_exp = experience_array[-1]
    if least_exp.has_served_a_meal? == false
        least_avg = 0
    else
      least_tips = least_exp.meals.collect{|meal| meal.tip}
      least_avg = least_tips.inject(0.0){|sum,i| sum + i} / least_tips.size
  end
  if most_exp.has_served_a_meal? == false
    most_avg = 0
  else
    most_tips = most_exp.meals.collect{|meal| meal.tip}
    most_avg = most_tips.inject(0.0){|sum,i| sum + i} / most_tips.size
  end
  "The least experienced waiter averaged $#{least_avg} in tips and the most experienced waiter averaged $#{most_avg} in tips."
end

  def has_served_a_meal?
    self.meals != []
  end

end
