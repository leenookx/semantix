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
        record = find_record
        if !record.nil?
            if time_diff_in_minutes( record.published ) > record.interval
                if grab_rss( record.url )
                    if dump_stories
                        validate_feed
                        update_feed_records
                    end
                end
            else
                puts "Feed retrieved too soon."
            end
        else
            puts "Couldn't find feed."
        end
    end

  private
    def find_record()
        record = Feed.find( @fid )

        return record
    end

    def grab_rss(url)
        @content = ""
        begin
            open(url) do |s| @content = s.read end
            @cache_file = 'local_cache/' + `uuidgen -r`.strip + '.feed'
            Feed.update(@fid, {:cache_file => @cache_file, :published => Time.now})
        rescue
            puts "Some problem grabbing the RSS file."
            @cache_file = nil
            return false
        end
       
        return true
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
        begin
            file = File.new(@cache_file, "w+")
            file << @content
            file.close
        rescue
            puts "Problem occurred when dumping the feed details."
            return false
        end
    end

    def time_diff_in_minutes (time)
        diff_seconds = (Time.now - time).round
        diff_minutes = diff_seconds / 60
        return diff_minutes
    end
end

f = FeedGrabber.new( feed_id )
f.go
 
