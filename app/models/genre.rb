class Genre
  # code here
  attr_accessor :name
  attr_reader :songs

  @@genres = []

  def initialize
    @@genres << self
    @songs = []
    @artists = []
  end

  def self.reset_all
    @@genres = []
  end

  def self.count
    @@genres.length
  end

  def self.all
    @@genres
  end

  def self.find_by_name(name)
    @@genres.find{|genre| genre.name == name}
  end

  def self.create_by_name(name)
    genre = Genre.new
    genre.name = name
    genre
  end

  def add_song(song)
    @songs << song
  end

  def add_artist(artist)
    @artists << artist
  end

  def artists
    @artists.uniq
  end
  
end