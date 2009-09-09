require 'open-uri'
require 'feed-normalizer'

class FeedWorker < Workling::Base

  def process_all_feeds(options)
    puts "Starting to check all feeds..."
    Feed.all.each do |f|
      FeedWorker.async_check_feed(:feedid => f.id)
    end
  end

  def check_feed(options)
    feed = Feed.find(options[:feedid])
    if feed != nil
      if feed.published.nil? or time_diff_in_minutes( feed.published ) > 60
        FeedWorker.async_grab_feed(options)
      end
    end
  end

  def grab_feed(options)
    content = ""
    begin
      feed = Feed.find(options[:feedid])
      open(feed.url) do |s| content = s.read end
      cache_file = RAILS_ROOT + '/local_cache/' + `uuidgen -r`.strip + '.feed'

      file = File.new(cache_file, "w+")
      file << content
      file.close

      Feed.update(options[:feedid], {:cache_file => cache_file})

      options[:cache_file] = cache_file

      FeedWorker.async_update_feed_details(options)
    rescue
      puts "Some problem grabbing the RSS file: " + $!
      return false
    end

    return true
  end

  def update_feed_details(options)
    begin
      rss = FeedNormalizer::FeedNormalizer.parse open( options[:cache_file] )
      interval = (rss.ttl == nil ? 60 : rss.ttl)
      Feed.update(options[:feedid], {:interval => interval, :description => rss.title, :published => Time.now})

      StoryWorker.async_grab_stories(options)
    rescue
      puts "Some other kind of error has occurred: " + $!
    end
  end

 private

  def time_diff_in_minutes (time)
    diff_seconds = (Time.now - time).round
    diff_minutes = diff_seconds / 60
    return diff_minutes
  end
end

