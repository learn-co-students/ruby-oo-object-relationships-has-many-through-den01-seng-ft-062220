require 'pry'

class Customer
  attr_accessor :name, :age

  def initialize name, age
    @name = name
    @age = age
    @@all << self
  end

  def new_meal waiter, total, tip = 0
    Meal.new(waiter, self, total, tip)
  end

  def self.all
    @@all
  end

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def waiters
    meals.reduce([]) do |waiters, meal|
      waiters << meal.waiter
    end
  end
end
