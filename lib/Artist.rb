require 'pry'
class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all =[]
  def initialize(name)
    @name = name 
    @songs = []
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
    artists.save
    artists 
  end 

  def add_song(song) 
     if song.artist == self 
       song.artist
     else 
       song.artist = self
      @songs << song
     end
  end 
  
  def genres
    Genre.all
  end 
end 