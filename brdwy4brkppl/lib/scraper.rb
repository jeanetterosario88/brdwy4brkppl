require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_mainpage
		html = open("https://broadwayforbrokepeople.com/")
   	page = Nokogiri::HTML(html)
	 	plays = page.search("table").search("tr").collect do |element|
    		cells = element.search("td")
    		names_discounts = {}
    		names_discounts[:name] = cells[1].text.gsub("\n","").strip unless cells[1].nil?
    		names_discounts[:discount] = cells[6].text.gsub("\n","").strip unless cells[6].nil?
    		names_discounts
  	  end

  	plays.delete_if { |e| e.empty? || e[:name].empty? }
  	plays.shift # removes the first element
  	return plays
  end



end
