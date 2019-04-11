class Information 
    attr_accessor :steps
    @@all = []

    def initialize(information) 
        information.each do |key, value|
            self.send("#{key}=", value)
        end 
            @@all << self 
    end

    def self.create_from_collection(information_array)
        information_array.each do |info_hash|
            Information.new(info_hash)
        end
    end

    def self.all
        @@all 
    end
    
    def save 
        @@all << self 
    end

end