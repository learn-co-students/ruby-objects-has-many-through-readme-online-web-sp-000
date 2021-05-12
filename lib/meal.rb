class Meal

    attr_reader :waiter, :customer
    attr_accessor :total, :tip
    
    @@all = []

    def self.all
        @@all
    end

    def initialize(waiter, customer, total, tip = 0)
        @waiter, @customer, @total, @tip = waiter, customer, total, tip
        @@all << self
    end
end