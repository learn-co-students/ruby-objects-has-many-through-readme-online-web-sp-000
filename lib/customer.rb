class Customer
  attr_accessor :name, :age
  @@all = [ ]
  
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def waiters
    waiters_array= [ ]
    Meal.all.each do |meal|
      if meal.customer == self
      waiters_array << meal.waiter
      end
    end
    waiters_array
  end
end
