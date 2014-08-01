require 'rspec'
require 'album'

describe Album do
  it "initializes an album" do
    new_album = Album.new ({:title => 'Warning', :artist => 'Greenday'})
    expect(new_album).to be_an_instance_of Album
  end
end
