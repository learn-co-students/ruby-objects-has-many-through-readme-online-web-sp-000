class Customer
  attr_accessor :name, :age
  @@all = []

  def initialize(name,age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  # A Customer creates a Meal, passing in a Waiter instance
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  # In plain English, the customer is going to look at all of the meals, and then select only the ones that belong to them. Translated into code, that could be written like the following:
  # We're iterating through every instance of Meal and returning only the ones where the meal's customer matches the current customer instance.
  def meals
    Meal.all.select do |meal|
        meal.customer == self
    end
  end
    # If a customer, Rachel, wants to know about all of her meals, all we need to do is call the #meals method on the her Customer instance.
    # rachel.meals #=> [#<Meal:0x00007fa23f1575a0 @waiter=#<Waiter:0x00007fa23f14fbe8 @name="Dan", @yrs_experience=22>, @customer=#<Customer:0x00007fa240987468 @name="Rachel", @age=27>, @total=50, @tip=10>]

    #  Each meal is also associated with a waiter, so to get every waiter from every meal Rachel has had, we need to take the array of all of Rachel's meals, map over it, getting the waiter from each of those meals.
    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end
    # And to finish out first real-life example, if Terrance wanted to find the name of his last waiter, we can use the #waiters method, then just get the name of the last waiter in the Array.
    # terrance.waiters.last.name

end