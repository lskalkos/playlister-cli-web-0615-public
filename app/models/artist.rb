class Artist
  # code here
  attr_accessor :name
  attr_reader :songs, :genres

  @@artists = []

  def initialize
    @@artists << self
    @songs = []
    @genres = []
  end

  def self.reset_all
    @@artists = []
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.length
  end

  def self.find_by_name(name)
    @@artists.find{|artist| artist.name == name}
  end

  def self.create_by_name(name)
    artist = Artist.new
    artist.name = name
    artist
  end

  def add_song(song)
    @songs << song
    if song.genre
      @genres << song.genre
      song.genre.add_artist(self)
    end
  end

  def add_songs(song_array)
    song_array.each {|song| add_song(song)}
  end

end