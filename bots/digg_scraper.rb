#!/usr/bin/ruby

require 'rubygems'
require 'open-uri'
require 'hpricot'

def BuildURL(query, pagenumber)
    return "http://digg.com/search/page" + pagenumber.to_s() + "?s=" + query + "&area=promoted&type=both&search-buried=0&sort=score&section=all"
end

def GetURLS(query)
    maxPage = 0
    url = BuildURL(query, 1)
    response = open(url, "User-Agent" => "Ruby/#[RUBY_VERSION]")
    doc = Hpricot( response )
    (doc/"a").each do |x|
        if x['href="search']
            puts x
        end
    end
    
    # Now we create an array of urls we need to gather
    urls = Array.new
    for i in 1..maxPage
        urls << BuildURL(i)
    end
    
    return urls
end

def GetArticles(url)
  html = Hpricot(Request(url))
  html.search("//a").each do |article|
    if(article['rel'] == "dc:source")
      url = item['href']
      title = item.inner_text.gsub(/view!|watch!/, '').strip # Removes "view!" and "watch!" from the end of image/video titles and remove whitespace either side of title
      puts "%s\n%s\n----------" % [name, url] # Print out what we found neatly
    end
  end
end

urls = GetURLS("penguin")
urls.each do |url|
    GetArticles(url)
end

