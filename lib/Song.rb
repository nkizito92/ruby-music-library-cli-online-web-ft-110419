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
        genre.songs << self
      end 
  end 
  
  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    
   find_art =  Artist.find_or_create_by_name(artist)
   find_gen =  Genre.find_or_create_by_name(genre.gsub(".mp3", ""))
    self.new(song, find_art, find_gen)
  end 
  
  def self.create_from_filename(filename) 
    artist, song, genre = filename.split(" - ")
    
  end 
  
  # def self.find_by_name(song_name)
  #   @@all.detect {|song| song.name == song_name}
  # end 
  
  # def self.find_or_create_by_name(find_name)
  #     find_by_name(find_name)  || create(find_name)
  # end 

end 