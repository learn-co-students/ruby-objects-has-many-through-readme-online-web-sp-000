class Waiter

    @@all = []

    def initialize(customer, total, tip=0)
        @customer = customer
        @total = total
        @tip = tip
        @all << self
    end

    def self.all
        @@all
    end


end