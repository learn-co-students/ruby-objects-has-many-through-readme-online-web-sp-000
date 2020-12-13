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
    best_tip = meals.max do |x, y|
        x.tip <=> y.tip
    end
    best_tip.customer
end

end