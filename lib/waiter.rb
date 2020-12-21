class Waiter
  attr_accessor :name, :experience

  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
  end

  def self.all
    @@all
  end

end
