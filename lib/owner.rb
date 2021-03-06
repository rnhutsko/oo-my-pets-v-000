class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all =[]
  

  def self.all
    @@all
  end 

  def save
    @@all << self
  end

  def initialize(name)
    @name = name
    @pets ={:fishes =>[], :dogs => [], :cats => []}
    @species ="human"
    self.save
    
  end

  def self.reset_all
    @@all =[]
  end

  def self.count
    count_of_owners = self.all.count
    count_of_owners
  end

  def species
    @species
  end
  
  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
      new_fish = Fish.new(name)
      new_fish.owner = self
      self.pets[:fishes] << new_fish
  end

  def buy_cat(name)
      new_cat = Cat.new(name)
      new_cat.owner = self
      self.pets[:cats] << new_cat
  end

  def buy_dog(name)
      new_dog = Dog.new(name)
      new_dog.owner = self
      self.pets[:dogs] << new_dog
  #binding.pry
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
      @pets.each do |type, pets|
        pets.each do |x|
          x.mood = "nervous"
          x.owner = nil
        end
      end
    @pets ={}
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

end