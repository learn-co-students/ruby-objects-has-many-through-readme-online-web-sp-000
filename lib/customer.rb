require "pry"
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
    
  def new_meal(a_waiter, a_total, a_tip)
    a_waiter = self.new(name, age)
    a_total = total
    d_tip = tip
  end
  
end