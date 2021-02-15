class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path=path
    end

    def files
        filenames = Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end   
        filenames
    end

    def import
        self.files.each do |filesname|
            Song.new_by_filename(filesname)
        end
    end
end