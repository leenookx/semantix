require 'tagcloud'

class TagcloudController < ApplicationController

  # GET /tagcloud
  # GET /tagcloud/1
  # GET /tagcloud/1.xml
  # GET /tagcloud/1.json
  def show

    check_cloud

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tc.get_cloud }
      format.json { render :json => @tc.get_cloud }
    end
  end

  # Create a new tag cloud.
  # POST /tagcloud/1
  # POST /tagcloud/1.xml
  def create
    @tc = nil

    check_cloud
  end

  # Update an existing tag cloud.
  # PUT /tagcloud/1
  # PUT /tagcloud/1.xml
  def update

    check_cloud

    @tc.add( params[:tagcloud] )
  end

 private

  def check_cloud
    if @tc.nil?
      @tc = TagCloud.new
    end
  end
end
