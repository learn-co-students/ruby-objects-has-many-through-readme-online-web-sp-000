class Meal

    @@all = []

    def initalize(customer, waiter, tip = 0)
        @customer = customer
        @waiter = waiter
        @tip = tip
        @@all << self
    end

    def self.all
        @@all
    end

end