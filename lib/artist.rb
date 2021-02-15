class Artist
    @@all=[]
    attr_accessor :name
    def initialize(name)
        @name=name
        @songs=[]
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|s| s.artist==self}
    end
    
    def add_song(song)
        @songs << song
        song.artist=self
    end

    def self.find_or_create_by_name(name)
        @@all.detect {|a| a.name==name} || a=Artist.new(name)
    end

    def print_songs
        @songs.each {|s| puts s.name}
    end 
end