class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    song = Song.new #to initialize/instantiate means to use .new
    @@all << song #or song.save
    song
  end

  def self.new_by_name(name)
    song = self.new #self or Song are the same
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name #flipping song.name = name it becomes hey lets set song.name equal to the value of name which is "Blank Space"
    #because song.name is equal to nil value. doing name = song.name will se the value equal to song.name which is nil.
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find { |e| e.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)   #or self.find_by_name(name) || self.create_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|e| e.name}
    #@@all.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename) #filename should be split at '-' and into song and artist. remove the .mp3,
    #split_filename = filename.slice(0, filename.size-4).split(' - ')
    split_filename = filename.chomp(".mp3"). split(" - ") #this will leave us with an array
    song = Song.new
    song.name = split_filename[1] #name of the song will be set equal to the second itme in the array
    song.artist_name = split_filename[0] #name of artist will be set equal to the first item in the array
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new #creates a new song
    song.name = split_filename[1] #sets the name to the second item in the array
    song.artist_name = split_filename[0] #set the artist to the first item in the array
    song.save #saves the song that was created
    song #returns the song
  end


  def self.destroy_all
    #self.all.clear 
    @@all.clear
  end
end
