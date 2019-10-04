class Waiter
  attr_accessor :name, :exp

  @@all = []

  def initialize(name, exp)
    @name = name
    @exp = exp
    @@all << self
  end

  def self.all
    @@all
  end

  def meals
    Meal.all.select {|meal|
      meal.waiter == self
    }
  end

  def best_tipper
    best_tip = 0
    Meal.all.each {|meal|
      if (meal.tip > best_tip)
        best_tip = meal.tip
      end
    }

    best_tipped_meal = Meal.all.find {|meal|
      meal.tip == best_tip
    }

    best_tipped_meal.customer


  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

end
