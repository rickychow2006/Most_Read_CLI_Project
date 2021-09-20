class Read 
    
    @@all = []

    attr_accessor :title, :author, :url, :numOfRead, :rating, :page, :publisher, :amazonLink

    def initialize (title, author, url, numOfReader)
        @title = title
        @author = author
        @url = url
        @numOfReader = numOfReader
        @@all << self
    end 

    def self.all
        @@all
    end 

    def print_review_author_and_title
        puts "#{@title} by #{@author}".colorize(:light_blue)
      end
    
    def self.print_books(input)
        self.all.take(input).each.with_index(1) do |book, index|
          puts "#{index}. #{book.title} by #{book.author}".colorize(:light_blue)
          sleep(0)
        end 
    end

    def print_full_review
        check_for_review
        print_review_author_and_title
        puts "-----------------------------------------"
        puts "Number of Readers: #{@numOfReader}".colorize(:light_blue)
        puts "-----------------------------------------"
        puts "Number of Pages: #{@page}".colorize(:light_blue)
        puts "-----------------------------------------"
        puts "Publisher: #{@publisher}".colorize(:light_blue)
        puts "-----------------------------------------"
        puts "Average Rating: #{@rating}".colorize(:light_blue)
        puts "-----------------------------------------"
        puts "Amazon Link: #{@amazonLink}".colorize(:light_blue)
        puts "-----------------------------------------"
    end 

    def check_for_review
        if @read === nil
          Scraper.new.second_scrape(self)
        end 
    end 
end 