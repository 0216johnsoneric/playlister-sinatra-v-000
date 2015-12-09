require 'spec_helper'

describe "Song" do
  before do 
    @artist = Artist.create(:name => "Taylor Swift") 

    blank_space =  Song.create(:name => "Blank Space", :artist => @artist) 

    pop = Genre.create(:name => "Pop")

    blank_space.genre_ids = pop.id
    
  end

  it "can initialize a song" do
    expect(Song.new).to be_an_instance_of(Song)
  end

  it "can have a name" do
    expect(song.name).to eq("Blank Space")
  end

  it "can have many genres" do 
    expect(SongGenre.count).to eq(2)
  end

  it "has an artist" do
    expect(song.artist).to eq(artist)
  end

  it "can slugify it's name" do
    song.slug

    expect(song.slug).to eq("blank-space")
  end

  describe "Class methods" do
    it "given the slug can find a song" do
      Song.find_by_slug(song.slug)

      expect((Song.find_by_slug(song.slug)).name).to eq("Blank Space")
    end
  end
end