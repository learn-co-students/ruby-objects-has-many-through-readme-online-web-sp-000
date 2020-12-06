class Customer
  attr_accessor :name, :age
  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
    @meals = []
    @waiters = []
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    new_meal = Meal.new(self, waiter, total, tip)
    @meals << new_meal
    @waiters << waiter
    new_meal
  end

    def meals
      @meals
    end

    def waiters
      @waiters
    end

end
