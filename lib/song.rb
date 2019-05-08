require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(str)
    self.all.find {|song| song.name == str}
  end

  def self.find_or_create_by_name(str)
    if self.find_by_name(str) == nil 
      self.create_by_name(str)
    else
      self.find_by_name(str)
    end
    # self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.artist_name = (file_name.split(" - "))[0]
    song.name= (file_name.split(" - "))[1].split(".")[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    song.artist_name = (file_name.split(" - "))[0]
    song.name= (file_name.split(" - "))[1].split(".")[0]
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end