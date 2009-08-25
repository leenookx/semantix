#!/usr/bin/ruby

require 'rubygems'
require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
require 'active_record'

feed_id = ARGV.pop

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = true

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :dbfile => "db/development.sqlite3"
)

require 'app/models/feed.rb'

class FeedGrabber < Object
    def initialize(feed_id)
        @fid = feed_id
    end

    def go
        find_record
        grab_rss
        update_feed_records
        dump_stories
    end

  private
    def find_record()
        record = Feed.find( @fid )      
        @url = record.url 
    end

    def grab_rss
        @content = ""
        open(@url) do |s| @content = s.read end
        @cache_file = 'local_cache/'+`uuidgen`+'.feed'
        # Try and parse the feed, using validation
        begin
            @rss = RSS::Parser.parse(@content, true)
        rescue
            # Something went wrong with the validation, so let's go without it...
            @rss = RSS::Parser.parse(@content, false)
        end
    end

    def update_feed_records
        Feed.update(@fid, {:description => @rss.channel.description, :cache_file => @cache_file, :published => Time.now})
    end

    def dump_stories
        # Write the feed out to disk
        file = File.new(@cache_file, "w+")
        file << @content
    end
end

f = FeedGrabber.new( feed_id )
f.go
 
