class Pose
    attr_accessor :pose, :name, :url, :info
    @@all = []

    def initialize(name, url)
        @name = name
        @url = url 
    end

    def self.all
        @@all
    end
    
    def save 
        @@all << self 
    end

end