class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| name == song.name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    
    #ARTIST - TITLE.EXTENSION
    file_parts = filename.match(/(^.+)(?:\s[-]\s)(.+)(?:[.])(.+)/)
    
    artist = file_parts[1]
    name = file_parts[2]
    extension = file_parts[3]
    
    song = self.new_by_name(name)
    song.artist_name = artist
    
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save #made #save method fluent
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
