#!/usr/bin/ruby

require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'active_record'

link_id = 1

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = true

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :dbfile => "db/development.sqlite3"
)

require 'app/models/link.rb'
require 'app/models/linked_page.rb'

record = Link.find( link_id )
cache_file = record.cache_file
puts cache_file

doc = Hpricot(open( cache_file ))

sitehash = Hash.new

(doc/"html/body//a ").each do |poss_story|
    link = "#{poss_story.attributes['href']}"
    if link != nil 
        if link[0..3] == "http"
            # We just want the first 'part' of the URL
            site = "#{poss_story.attributes['href']}".split(/\//)

            if sitehash.has_key?(site[2])
                sitehash[site[2]] = sitehash[site[2]] + 1
            else
                sitehash[site[2]] = 1
            end
        end
    end
end

sitehash.each { |elem|
    puts "#{elem[0]} => #{elem[1]}"
    record.linked_pages.create(:link_id => link_id, :url => elem[0], :count => elem[1])
}

