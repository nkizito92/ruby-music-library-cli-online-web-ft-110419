require 'pry'
class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre 
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist if artist  
    self.genre = genre if genre
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
  
  def self.create(name) 
    song = self.new(name)
    song.save
    song
  end 
  
  def artist=(artist)
      @artist = artist
     artist.add_song(self)
  end 
  def genre=(genre)
     @genre = genre
     if genre.songs.include? self
       genre.songs 
      else 
        # binding.pry
        genre.songs << self
      end 
  end 
  
  # def self.find_by_name(song_name)
  #   @@all.detect {|song| song.name == song_name}
  # end 
  
  # def self.find_or_create_by_name(find_name)
  #     find_by_name(find_name)  || create(find_name)
  # end 

end 