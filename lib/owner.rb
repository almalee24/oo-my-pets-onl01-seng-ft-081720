class Owner
  attr_accessor :cats, :dogs
  attr_reader :species, :name

@@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
    @cats = []
    @dogs = []
  end

  def say_species 
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end


  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def feed_cats
    @cats.each {|cat| cat.mood = 'happy' } 
  end

  def walk_dogs
    @dogs.each {|dog| dog.mood = "happy" }
  end

  def sell_pets 
    @cats.each do |cat|
      @cats.delete(cat)
      cat.mood = "nervous"
      cat.owner = nil
    end

    @dogs.each do |dog|
      @dogs.delete(dog)
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{@dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end

