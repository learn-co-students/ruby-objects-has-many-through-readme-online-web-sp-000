class Waiter
	attr_accessor :name, :experience

	@@all = []

	def initialize(name, experience)
		@name = name
		@experience = experience
		@@all << self
	end

	def self.all
  	@@all
  end

  def new_meal(customer, total, tip)
  	Meal.new(self, customer, total, tip)
  end

  def meals
  	Meal.all.select {|meal| meal.waiter == self}
  end

  def tips
  	meals.map {|meal| meal.tip}
  end

  def best_tipper
  	best_tip = self.tips.sort.last
  	best_meal = meals.find {|meal| meal.tip == best_tip}
  	best_meal.customer
  end

end