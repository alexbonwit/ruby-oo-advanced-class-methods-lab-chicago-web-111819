require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
    song
  end

  def self.create_by_name(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name  == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    splitname = filename.split(' - ')
    songname = splitname[1].gsub(".mp3", "")
    song  = Song.create_by_name(songname)
    song.artist_name = splitname[0]
    song
  end

  def self.create_from_filename(filename)
    splitname = filename.split(' - ')
    songname = splitname[1].gsub(".mp3", "")
    song  = Song.create_by_name(songname)
    song.artist_name = splitname[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
