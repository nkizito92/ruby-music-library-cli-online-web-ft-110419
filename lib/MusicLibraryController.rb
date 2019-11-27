require 'pry'
class MusicLibraryController
  attr_accessor :path 
  def initialize(path)
    binding.pry
    @path = path 
  end 
end 