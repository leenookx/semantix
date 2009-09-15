require 'open-uri'

class FlickrController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    url = "http://api.flickr.com/services/feeds/photos_public.gne?tags=" + params[:id] + "&tagmode=any&format=json"
    @flickr_data = open( url ).read

    @flickr_data.gsub!(/^jsonFlickrFeed\(/,'')
    @flickr_data.gsub!(/\)$/,'')

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @flickr_data }
    end
  end
end
