require "brdwy4brkppl/version"

class Show
  
  attr_accessor :name :discount
  
  @@all = []
  
  def initialize(name, discount)
    @name = name
    @discount = discount
end
  
  def name
    @name
  end
  
  def discount
    @discount
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    newshow = Show.new(name)
    newshow.save
    newsong
  end
  
end
