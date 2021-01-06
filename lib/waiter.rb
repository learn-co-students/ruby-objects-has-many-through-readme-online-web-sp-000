class Waiter
  attr_accessor :name, :yearsofexperience
  @all = [ ]

  def initialize(name, yearsofexperience)
    @name = name
    @yearsofexperience = yearsofexperience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    largest_tip= Meal.all.collect {|meal| meal.tip}.sort.last
    largest_tip_customer= Meal.all.find {|meal| meal.tip == largest_tip}.customer
  end

end
