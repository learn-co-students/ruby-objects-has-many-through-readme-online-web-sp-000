class Customer
  attr_accessor :name, :age, :meal
  attr_reader :waiter
  @@all = []
  @@meals = []

  def initialize(name,age)
    @name = name
    @age = age
    #@meal = meal
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter,total,tip=0)
    Meal.new(waiter,self,total,tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

end
