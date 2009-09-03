require 'open-uri'
require 'feed-normalizer'

class StoryWorker < Workling::Base
  def grab_stories(options)
    feed = Feed.find(options[:feedid])
    cache_file = options[:cache_file]
    rss = FeedNormalizer::FeedNormalizer.parse open( cache_file )
    if !rss.nil?
      rss.entries.each do |story|
        feed.stories.create(:feed_id => options[:feedid], :url =>story.url, :details => story.content)
      end
    else
      puts "RSS feed was null."
    end
  end
end

