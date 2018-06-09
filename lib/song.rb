require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    return create_by_name(name) if !!@@all.include?(name) == false

      find_by_name(name)
end

  def self.alphabetical
    @@all.sort_by{|k| k.name}
  end

  def self.new_from_filename(filename)
    file_arr = filename.split(" - ")
    song = self.new
    @name = file_arr[1].chomp(".mp3")
    song.name = @name
    @artist_name = file_arr[0]
    song.artist_name = @artist_name
    @@all << song
    song
  end

  def self.create_from_filename(filename)
    file_arr = filename.split(" - ")
    song = self.new
    @name = file_arr[1].chomp(".mp3")
    song.name = @name
    @artist_name = file_arr[0]
    song.artist_name = @artist_name
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end




end
