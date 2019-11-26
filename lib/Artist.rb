require 'pry'
class Artist 
  attr_accessor :name, :songs
  @@all =[]
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
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
  
  def self.create(artist)
    artists = self.new(artist)
    @@all << artists
    artists 
  end 
  def songs 
    @songs 
  end 
  
  def add_song(song) 
     if song.artist != ""
       song.artist
     else 
      # binding.pry
       colect = song.artist = self
       @@songs << colect
     end
  end 
end 