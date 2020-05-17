require 'open-uri'
require 'pry'

class Scraper

  def make_show
    #shows_array will return the scraped/parsed index page of all shows
    #it returns the nokogiri object(array thing)
    show_array = Scraper.scrape_mainpage(BASE_PATH + 'index.html')
    #this creates the show instances with the following attributes: :name, :discount
    Show.create_from_collection(shows_array)
  end


  def self.scrape_mainpage
		html = open(https://broadwayforbrokepeople.com/)
   	page = Nokogiri::HTML(open(https://broadwayforbrokepeople.com/)
		shows = page.css(“CLASS”)
    	page.css(“CLASS ”).collect do |element|
			 {:name => element.css(“CLASS”).text , 
	       :discount => element.css(“CLASS”).text
			 }
  	  end
  end

end
