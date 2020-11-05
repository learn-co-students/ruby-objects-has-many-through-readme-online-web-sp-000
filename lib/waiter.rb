class Waiter
	attr_accessor :name, :exp_yrs

	@@all = []

	def self.all
		@@all
	end

	def initialize(name, exp_yrs)
		@name = name
		@exp_yrs = exp_yrs
		@@all.push(self)
	end

	def new_meal(customer, total, tip=0)
		Meal.new(self, customer, total, tip)
	end

	def meals
		Meal.all.filter{|meal| meal.waiter == self}
	end

	def best_tipper
		meals.max_by{|meal| meal.tip}.customer
	end
end
