class Customer
  attr_accessor :name, :age
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    self.class.all << self
  end

  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer == self }
  end

  # it "returns an Array of Waiter instances associated with this customer's meals" do
  def waiters
    w_arr = []
    Meal.all.each do |meal| 
      if meal.customer == self 
        w_arr << meal.waiter
      end
    end
    w_arr
  end
end