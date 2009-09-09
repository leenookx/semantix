require 'open-uri'
require 'json'

class TwitterWorker < Workling::Base

  def grab_trends(options)
    puts "Starting grab of twitter trends."

    url = 'http://search.twitter.com/trends.json'
    data = open(url, "UserAgent" => "Ruby-Wget").read

    puts "got data from twitter"
    puts data

    doc = JSON.parse( data )

    puts "Parsed json"

    head = TwitterTrendHead.create(:as_of => doc['as_of'])

    puts "Got some head!"

    begin
      trends = doc['trends']
      trends.each do |trend|
        TwitterTrend.create(:head => head.id,
                         :name => trend['name'], 
                         :url => trend['url'])
      end
    rescue
      puts "Couldn't ingest trends: " + $!
    end

    puts "Twitter trends grab complete"
  end
end

