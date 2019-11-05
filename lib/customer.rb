class Customer

    @@all = []

    def initialize(waiter, total, tip=0)
        @total = total
        @tip = tip
        @tip = tip
        @@all << self
    end

    def self.all
        @@all
    end
/learn
end
