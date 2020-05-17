require 'open-uri'
require 'pry'

class Scraper
  
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
