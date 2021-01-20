class Song
  attr_accessor :name, :artist_name
  @@all = []
  # def initialize(name)
  #   @name = name
  #   @@all << self
  # end
  # def initialize(name)
  #   @name = name
  # end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # def self.create(name)
  #     song = self.new(name)
  #     song.save
  #     return song
  # end
  def self.create
    song = self.new
    song.save
    song
  end
  def self.new_by_name(name)
   song = self.new
   song.name = name
  #  song.save
   song
  end
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
   if self.find_by_name(name)  #could also be written as self.find_by_name(name) || self.create_by_name(name)
      self.find_by_name(name)
   else 
    self.create_by_name(name)
   end
  end
  def self.alphabetical
    self.all.sort_by {|song| song.name} #
  end
  def self.new_from_filename(fn)
    song = self.new
    split_fn = fn.chomp(".mp3").split(" - ")
    song.name = split_fn[1]
    song.artist_name = split_fn[0]
    song
  end
  def self.create_from_filename(fn)
    song = self.create
    split_fn = fn.chomp(".mp3").split(" - ")
    song.name = split_fn[1]
    song.artist_name = split_fn[0]
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
