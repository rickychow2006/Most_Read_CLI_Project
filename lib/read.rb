class Read 
    @all = []

    attr_accessor :title, :author, :url, :numOfRead, :rating, :page, :publisher, :amazonLink

    def initialize (title, author, url, numOfReader)
        @title = title 
        @author = author
        @url = url
        @numOfReader = numOfReader
        @all << self 
    end 

    def self.all
        @@all
    end 
end 