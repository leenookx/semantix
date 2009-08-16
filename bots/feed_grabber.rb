#!/usr/bin/ruby

require 'rubygems'
require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
require 'active_record'

feed_id = 1

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = true

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :dbfile => "db/development.sqlite3"
)

require 'app/models/feed.rb'

record = Feed.find( feed_id )
url = record.url

content = ""
open(url) do |s| content = s.read end
cache_file = 'local_cache/'+`uuidgen`+'.feed'
# Try and parse the feed, using validation
begin
    rss = RSS::Parser.parse(content, true)
rescue
    # Something went wrong with the validation, so let's go without it...
    rss = RSS::Parser.parse(content, false)
end

Feed.update(feed_id, {:description => rss.channel.description, :cache_file => cache_file, :published => Time.now})
 
