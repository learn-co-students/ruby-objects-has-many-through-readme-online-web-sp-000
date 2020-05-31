class Waiter
  attr_accessor :name, :years

@@all = [ ] #creates a new empty array

def initialize(name, years) #the Waiter class  has a class variable that stores every waiter instance upon initialization
  @name = name
  @years = years
  @@all << self
end

def self.all #class method that returns the contents of @@all
  @@all
end

def new_meal(customer, total, tip=0) #initializes a meal using the current Waiter instance
Meal.new(self, customer, total, tip) #provided a customer instance and a total and a tip
end

  def meals #returns an array of Meal instances associated with the waiter (all meals the waiter has served)
    Meal.all.select do |meal| #by iterating over each meal the waiter has given
      meal.waiter == self #checking for waiter now
    end
  end

def best_tipper #returns the Customer instance associated with the meal that recieved the largest tip
  best_tipped_meal = meals.max do |meal_a, meal_b| #iterating to find the max between two meals
    meal_a.tip <=> meal_b.tip #comparing the meals
end
    best_tipped_meal.customer #returning the best tipper by calling on the customer
  end


end

jason = Waiter.new("Jason", 4)
lisa = Customer.new("Lisa", 24)
tim = Customer.new("Tim", 35)
terrance = Customer.new("Terrance", 27)

terrance.new_meal(jason, 50, 3)
lisa.new_meal(jason, 40, 10)
tim.new_meal(jason, 45, 8)

jason.best_tipper #=> #<Customer:0x00007f80829959a8 @name="Lisa", @age=24>
jason.best_tipper.name #=> "Lisa"
