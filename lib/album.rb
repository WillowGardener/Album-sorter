class Album
  @@albums = []

  attr_reader :title, :artist

  def initialize attributes
    @title = attributes[:title] #string
    @artist = attributes[:artist] #string
    @@albums << self
  end

  def Album.albums
    @@albums
  end

  def edit_artist artist
    @artist = artist
  end

  def edit_title title
    @title = title
  end

  def Album.search search
    result = ""
    @@albums.each do |album|
      if album.title == search
      result = album
      elsif album.artist == search
      result = album
      end
    end
    result
  end
end
