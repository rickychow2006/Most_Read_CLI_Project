class Scraper 
    def initialize 
        @base_url = "https://www.goodreads.com/"
    end 

    def first_scrape
        page = Nokogiri::HTML(open(@base_url + "/book/most_read").read)
        page.css("tr").each do |book|
          title = book.css("[itemprop='name']")[0].text
          author = book.css("[itemprop='name']")[1].text
          url = "https://www.goodreads.com/#{book.css(".bookTitle").first['href']}"
          numOfReader = book.css(".greyText.statistic").text.strip.split("\n").first
    
          read = Read.new(title, author, url, numOfReader)
        end
    end 

end 