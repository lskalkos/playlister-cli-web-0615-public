require 'pry'

class LibraryParser
  # code here

  MP3_DIR = "./db/data"

  def files
    files = Dir.entries(MP3_DIR)
    files.shift
    files.shift
    files
  end

  def parse_filename(name)
    name.scan(/(.*) - (.*) \[(.*)\].mp3/).first
  end

  def build_song(artist_name, song_name, genre_name)
    song = Song.new
    song.name = song_name

    artist = Artist.new
    artist.name = artist_name
    song.artist = artist

    genre = Genre.new
    genre.name = genre_name
    song.genre = genre
    song
  end

  def call
    # song_files = files
    files.each do |file|
      parts = parse_filename(file)
      build_song(parts[0], parts[1], parts[2])
    end

  end

end