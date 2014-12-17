require 'feed-utils'

class TopixController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    topix = TopixGrabber.new
    @topix_data = topix.query(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.rss  { render :rss => @topix_data }
    end
  end
end
