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
    #text cleanup below
  	plays.delete_if { |e| e.empty? || e[:name].empty? } #removes random empty hashes
  	plays.shift #removes the first element, which we don't need
  	return plays
  end



end
