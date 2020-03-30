class Waiter
  attr_accessor :name, :years_experience, :customer
  @@all = []
  def initialize(name, years_experience)
  @name = name
  @years_experience = years_experience
  @@all << self
  end
  def self.all
    @@all
  end
  def new_meal(customer,total,tip = 0)
    Meal.new(self,customer,total,tip )
  end
  def meals
    Meal.all.select{|meal|meal.waiter == self}
  end
  def best_tipper
    customer = ""
    value = 0
    Meal.all.each{|meal|
      if meal.waiter == self
        if meal.tip > value
        value = meal.tip
        customer =  meal.customer
    end
      end
    }
      customer
  end
end
