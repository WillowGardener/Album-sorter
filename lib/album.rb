class Album
  @@albums = []

  attr_reader :title, :artist

  def initialize attributes
    @title = attributes[:title]
    @artist = attributes[:artist]
    @@albums << self
  end

  def Album.albums
    @@albums
  end

  def add_artist artist
    @artist = {:artist => artist}
  end

  def add_title title
    @title = {:title => title}
  end

end
