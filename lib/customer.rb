class Customer
  
  @all = []
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
  
  def self.all
    @all
  end
  
end

class Waiter
  attr_accessor :name, :yrs_experience
  @@all = []
  def initialize()