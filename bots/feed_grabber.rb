#!/usr/bin/ruby

require 'rubygems'
require 'open-uri'
require 'feed-normalizer'
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
        dump_stories
        validate_feed
        update_feed_records
    end

  private
    def find_record()
        record = Feed.find( @fid )      
        @url = record.url 
    end

    def grab_rss
        @content = ""
        open(@url) do |s| @content = s.read end
        @cache_file = 'local_cache/'+`uuidgen -r`.strip+'.feed'
        Feed.update(@fid, {:cache_file => @cache_file, :published => Time.now})
    end

    def validate_feed
        # Try and parse the feed
        puts @cache_file
        begin
            @rss = FeedNormalizer::FeedNormalizer.parse open( @cache_file )
            puts @rss.title
        rescue OpenURI::HTTPError => e
            puts "Looks like the feed URL is not valid. (" + e.message + ")"
        rescue
            puts "Some other kind of error has occurred: " + $!
        end
    end

    def update_feed_records
        puts @rss.title
        Feed.update(@fid, :description => @rss.title)
    end

    def dump_stories
        # Write the feed out to disk
        file = File.new(@cache_file, "w+")
        file << @content
        file.close
    end
end

f = FeedGrabber.new( feed_id )
f.go
 
