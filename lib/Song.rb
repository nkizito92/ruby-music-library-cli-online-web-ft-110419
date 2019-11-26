require 'pry'
class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist if artist  
    self.genre = genre if genre
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
  
  def artist=(artist)
      @artist = artist
     artist.add_song(self)
  end 

end 