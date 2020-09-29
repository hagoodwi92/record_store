class Album
  attr_reader :id, :name
  attr_accessor :name , :year , :genre, :artist
  @@albums = {}
  @@total_rows = 0

  def self.sort()
    #NEed to target name in the Album object 
    # then, we can use built in method .sort() to organize alphabetically 
    return @@albums.sort()
  end

  def self.search(search_name)
    @@albums.each do |album|
      return album[self.name]
    end
  end

  def initialize(name, year, genre, artist, id)
    @name = name
    @year = year
    @genre = genre
    @artist = artist
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.year, self.genre, self.artist, self.id)
  end

  def ==(album_to_compare)
    (self.name() == album_to_compare.name()) &
    (self.year() == album_to_compare.year()) &
    (self.genre() == album_to_compare.genre()) &
    (self.artist() == album_to_compare.artist())
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.year, self.genre, self.artist, self.id)
  end

  def delete()
    @@albums.delete(self.id)
  end
end
