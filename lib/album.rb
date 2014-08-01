class Album
  @@albums = []
  @@artists = []

  attr_reader :title, :artist

  def initialize attributes
    @title = attributes[:title] #string
    @artist = attributes[:artist] #string
    @@albums << self
    if @artist != nil
      @@artists << @artist
    end
  end

  def Album.albums
    @@albums
  end

  def edit_artist artist
    @artist = artist
    @@artists << @artist
  end

  def edit_title title
    @title = title
  end

  def Album.search search
    result = []
    @@albums.each do |album|
      if album.title.downcase == search.downcase
      result << album
      elsif album.artist.downcase == search.downcase
      result << album
      end
    end
    result
  end

  def Album.artists
    @@artists.uniq
  end

end
