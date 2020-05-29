class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new;
    song.save
    song
  end

  def self.new_by_name(name)
    song=Song.new
    song.name =name
    song
  end

  def self.create_by_name(name)
    song=Song.new
    song.name =name
    song.save
    song
  end

  def self.find_by_name(name)
      @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)? self.find_by_name(name) : self.create_by_name(name)
  #  self.create_by_name(name) if !self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|element| element.name}
  end



  def save
    self.class.all << self
  end

  def self.new_from_filename(file)
    split_file = file.split(/[-.]/).map{|element| element.strip}
    song=Song.new
    song.artist_name= split_file[0]
    song.name= split_file[1]
    song
  end

  def self.create_from_filename(file)
    split_file = file.split(/[-.]/).map{|element| element.strip}
    song=Song.new
    song.artist_name= split_file[0]
    song.name= split_file[1]
    song.save
    song
  end
def self.destroy_all
  self.all.clear
end
  
end
