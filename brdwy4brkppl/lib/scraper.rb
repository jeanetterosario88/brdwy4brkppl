require 'open-uri'
require 'pry'

class Scraper

  def make_show
    #shows_array will return the scraped/parsed index page of all shows
    #it returns the nokogiri object(array thing)
    show_array = Scraper.scrape_mainpage(BASE_PATH + 'index.html')
    #this creates the show instances with the following attributes: :name, :location, :profile_url
    Show.create_from_collection(shows_array)
  end


  def self.scrape_mainpage((theurl))
    page = Nokogiri::HTML(open(theurl))
    allshows = []
    page.css(“  CLASS ”).each do |show|
     name = show.css(“.CLASS”).text
k = Song.
     Show.new.name = name
     discountinfo = show.css(“CLASS”).text
     Show.new.discount = discountinfo
     show_information = {:name => name,
                :discountinfo => discountinfo}
      allshows << show_information
      end
    allshows
   end

end
