class Customer 
    attr_accessor :age, :name, :waiter
    @@all = []
  def initialize(name, age)
    @name = name 
    @age = age
    @@all << self  
  end

  def self.all 
    @@all 
  end

  def new_meal(waiter, total, tip)
    new_meal = Meal.new(waiter, self, total, tip)
  end

  def meals 
    Meal.all.select {|inst| inst.customer == self}
  end

  def waiters 
    meals.map {|meal| meal.waiter}
  end
end