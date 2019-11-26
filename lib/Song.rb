require 'pry'
class Song 
  attr_accessor :name, :saves, :artist 
  @@all = []
  def initialize(name, artist="")
    @name = name 
    @saves = saves
    save
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(song) 
    songs = self.new(song)
    @@all << songs
    songs
  end 
end 