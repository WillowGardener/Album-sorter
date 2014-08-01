require 'rspec'
require 'album'

describe Album do
  it "initializes an album" do
    new_album = Album.new ({:title => 'Warning', :artist => 'Greenday'})
    expect(new_album).to be_an_instance_of Album
  end

  it "adds album to albums" do
    new_album = Album.new ({:title => 'The Cost of Living', :artist => 'Jason Webley'})
    expect(Album.albums[1]).to eq(new_album)
  end

  it "retrieves all albums" do
    cd = Album.new ({:title => 'Jagged Little Pill'})
    expect(Album.albums.length).to eq(3)
  end

  it "add an artist to an existing album" do
    cd = Album.new ({:title => 'Jagged Little Pill'})
    cd.add_artist("Alanis Morissette")
    expect(cd.artist.fetch(:artist)).to eq("Alanis Morissette")
  end

  it "add an album title to an existing artist" do
    cd = Album.new ({:artist => "Rilo Kiley"})
    cd.add_title("Take Offs and Landings")
    expect(cd.title.fetch(:title)).to eq("Take Offs and Landings")
  end

end
