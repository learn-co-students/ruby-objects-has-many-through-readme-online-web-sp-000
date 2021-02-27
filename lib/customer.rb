class Customer
   attr_accessor :name, :age
 
  @@all = []
 
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
    # we don't need to take customer in as an argument, because we're passing in self as a reference
  end
end