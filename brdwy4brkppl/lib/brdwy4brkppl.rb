require "brdwy4brkppl/version"

module Brdwy4brkppl
  class Error < StandardError; end
  # Your code goes here...
end
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_mainpage_and_create
    page = Nokogiri::HTML(open(index_url))
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