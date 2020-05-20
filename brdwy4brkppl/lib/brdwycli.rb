require_relative "../lib/scraper.rb"
require_relative "../lib/show.rb"
require 'nokogiri'

class BrdwayCLI

class InputError < StandardError
    def message
      puts "please provide a valid entry"
    end
end

def run
    make_shows
    call_it
 end

def make_shows
    #shows_array will return the scraped/parsed index page of all shows
    #it returns the nokogiri object(array thing)
    shows_array = Scraper.scrape_mainpage
    #this creates the student instances with the following attributes: :name, :location, :profile_url
    Show.create_from_collection(shows_array)
  end


  def call_it
    input = ""
    while input != "exit"
      puts "Welcome to your Broadway Discount Finder: Cheap Ticket Policies for Broadway Shows!"
      puts "To get a list of all current and upcoming broadway shows, enter 'all shows.'"
      puts "To get discount information for a specific show, enter 'discount'."
      puts "To quit, type exit."
      puts "What would you like to do?"
      input = gets.strip

      case input
      when "all shows"
        list_shows
      when "discount"
        print_discount
      when "exit"
        return
      else
          begin
            raise InputError
          rescue InputError => error
            error.message
          end
      end
    end
  end


  def list_shows
    sorted = Show.all.sort_by {|show|show.name}
    sorted.each.with_index do |show, index|
      newnum = index + 1
      puts "#{newnum}. #{show.name}"
    end
  end

  def print_discount
    list_shows
    puts "Which show would you like to see? Type its corresponding number."
    list_of_shows = Show.all.sort{ |a, b| a.name <=> b.name }
    input = gets.strip.to_i
    if (1..Show.all.length).include?(input)
      show = list_of_shows[input-1]
      puts "#{show.name} discounts: #{show.discount}"
    else
      puts "Wrong input.  Please try again."
    end
  end

end
