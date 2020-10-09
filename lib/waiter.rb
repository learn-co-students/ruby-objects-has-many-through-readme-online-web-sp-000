require "pry"

class Waiter

    attr_accessor :name, :yrs_experience
  
    @@all = []
  
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
  
    def self.all
      @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def customers
        meals.map do |meal|
          meal.customer
        end
    end
  
    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end

    def most_frequent_customer
        customer_list = customers.uniq
        counts = []
        customer_list.each do |c|
            counts << customers.count(c)
        end
        customer_list[counts.max]

    end

    def worst_tipper_meal
        meals.min { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }
    end

    def avg_tip
        mls = []
        meals.each{ |m| mls << m.tip }
        num = mls.sum.to_f
        den = mls.size.to_f
        num/den
    end

    def self.senior_avg_tip
        senior.avg_tip
    end

    def self.junior_avg_tip
        junior.avg_tip
    end

    def self.waiters_by_yrs_of_xp
        self.all.sort { |sr, jr| sr.yrs_experience <=> jr.yrs_experience }
    end

    def self.senior
        self.waiters_by_yrs_of_xp.last
    end

    def self.junior
        self.waiters_by_yrs_of_xp.first
    end
  
end
  