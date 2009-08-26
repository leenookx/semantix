#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'active_record'
require 'feed-normalizer'

require File.dirname(__FILE__) + '/../config/boot'
ENV["RAILS_ENV"]='development'
require RAILS_ROOT + '/config/environment'

feed_id = ARGV.pop

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = true

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :dbfile => "db/development.sqlite3"
)

ActsAsFerret::Remote::Config::RAILS_ROOT = `pwd`

require 'app/models/feed.rb'
require 'app/models/story.rb'

class StoryGrabber < Object
    def initialize(feed_id)
        @fid = feed_id
    end

    def go
        get_cache_file
        grab_feed_contents
    end

  private
    def get_cache_file
        @feed_record = Feed.find( @fid )
        @cache_file = @feed_record.cache_file
    end

    def grab_feed_contents
        contents = String.new

        begin
            begin
                feed = FeedNormalizer::FeedNormalizer.parse open( @cache_file )
            rescue
                puts "something went wrong..."
            end

            if feed.nil?
                puts "Sorry, that URL is not RSS 0.9x/1.0/2.0 or Atom 1.0 and can't be processed right now."
            else
                puts feed.title

                feed.entries.each do |story|
                    puts "#{story.title}"
                    @feed_record.stories.create(:feed_id => @fid, :url => story.url, :details => story.content)
                end

                # There seems to be a bug in ferret that means that this
                # is not done automatically...
                Story.rebuild_index
            end

        rescue => err
            puts "Exception: #{err}"
            err
        end
    end
end 

grabber = StoryGrabber.new( feed_id )
grabber.go

