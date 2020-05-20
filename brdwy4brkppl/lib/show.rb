class Show

  attr_accessor :name, :discount

  @@all = []

  def initialize(show_hash)
    #@name = show_hash[:name]
    self.send("name=", show_hash[:name])
    #@discount = show_hash[:discount]
    self.send("discount=", show_hash[:discount])
    @@all << self
  end

  def self.create_from_collection(show_array)
    show_array.each do |show_hash| #each show is a hash
      Show.new(show_hash)
    end
  end

  def self.all
    @@all
  end


  end
