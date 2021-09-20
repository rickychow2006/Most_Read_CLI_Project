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

    def second_scrape(read)
        review_html = open(read.url)
        review_html_parsed_to_elements = Nokogiri::HTML(review_html)
        read.rating = review_html_parsed_to_elements.css("[itemprop='ratingValue']").text.strip
        read.page = review_html_parsed_to_elements.css("[itemprop='numberOfPages']").text.strip
        read.publisher = review_html_parsed_to_elements.css("#details .row").text.split(/by |\n\n/)[1]
        read.amazonLink = "https://www.goodreads.com/#{review_html_parsed_to_elements.css("#buyButton").first['href']}"
    end

end 