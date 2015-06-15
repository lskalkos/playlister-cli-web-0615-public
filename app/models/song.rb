class Song
  # code here
  attr_accessor :name, :artist
  attr_reader :genre

  @@songs = []

  def initialize
    @@songs << self
  end

  def self.all
    @@songs
  end

  def self.count
    @@songs.length
  end

  def self.reset_all
    @@songs = []
  end

  def self.find_by_name(name)
    @@songs.find{|song| song.name == name}
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def genre=(genre)
    genre.add_song(self)
    @genre = genre
  end

end