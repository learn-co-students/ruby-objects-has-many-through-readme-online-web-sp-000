class Meal
    # customer has many meals and waiters, meals are the joining factor between customer and waiter
    attr_accessor :waiter, :customer, :total, :tip
 
    @@all = []
 
    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all << self
    end
    
    def self.all
        @@all
    end

end