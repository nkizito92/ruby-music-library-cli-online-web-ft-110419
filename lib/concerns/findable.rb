module Concerns 
  module Findable
     def find_by_name(song_name)
       self.all.detect {|song| song.name == song_name}
      end 
  
  def find_or_create_by_name(find_name)
      find_by_name(find_name) || create(find_name)
    end 
  end 
  
end 