class Customer
attr_accessor :name, :age #each customer instance has a name and age
#attr_accessor allows for customer to change their name and age
#attr_reader would not allow for a customer to change their name and age


@@all = [ ] #creates a new array of instances

def initialize(name, age) #initializes w a name and age
  @name = name
  @age = age
@@all << self
end

def self.all #returns the contents of @@all
  @@all
end

#ability to create a meal:
def new_meal(waiter, total, tip=0) #initializes a meal using the current Customer instance
  Meal.new(waiter, self, total, tip) #provided a Waiter instance, a total, and a tip
end #self: we don't need a customer argument because we are passing in self as a reference to the current instance of customer.


def meals #returns an array of Meal instances associated with this customer (all meals customer had)
  Meal.all.select do |meal| #by iteration over every meal the customer had
    meal.customer == self
  end
end

def waiters #returns an array of waiters
  meals.map do |meal| #by iterating over each meal the waiter gave
    meal.waiter
  end
end

end

#sam = Customer.new("Sam", 27)
#pat = Waiter.new("Pat", 2)
#alex = Waiter.new("Alex", 5)

#sam.new_meal(pat, 50, 10) # A Customer creates a Meal, passing in a Waiter instance
#sam.new_meal(alex, 20, 3) # A Customer creates a Meal, passing in a Waiter instance
#pat.new_meal(sam, 30, 5) # A Waiter creates a Meal, passing in a Customer instance

#rachel = Customer.new("Rachel", 27)

#rachel.new_meal(dan, 50, 10) #call meal method on her customer instance

#rachel.meals #=> [#<Meal:0x00007fa23f1575a0 @waiter=#<Waiter:0x00007fa23f14fbe8 @name="Dan", @yrs_experience=22>, @customer=#<Customer:0x00007fa240987468 @name="Rachel", @age=27>, @total=50, @tip=10>]
#rachel.meals.length #=> 1

#Meal.all.length #=> 2
