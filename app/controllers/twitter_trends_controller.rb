class TwitterTrendsController < ApplicationController
  # GET /twitter_trends
  # GET /twitter_trends.xml
  def index
    @twitter_trends = TwitterTrend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @twitter_trends }
    end
  end

  # GET /twitter_trends/1
  # GET /twitter_trends/1.xml
  def show
    @twitter_trend = TwitterTrend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @twitter_trend }
    end
  end

  # GET /twitter_trends/new
  # GET /twitter_trends/new.xml
  def new
    @twitter_trend = TwitterTrend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @twitter_trend }
    end
  end

  # GET /twitter_trends/1/edit
  def edit
    @twitter_trend = TwitterTrend.find(params[:id])
  end

  # POST /twitter_trends
  # POST /twitter_trends.xml
  def create
    @twitter_trend = TwitterTrend.new(params[:twitter_trend])

    respond_to do |format|
      if @twitter_trend.save
        flash[:notice] = 'TwitterTrend was successfully created.'
        format.html { redirect_to(@twitter_trend) }
        format.xml  { render :xml => @twitter_trend, :status => :created, :location => @twitter_trend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @twitter_trend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_trends/1
  # PUT /twitter_trends/1.xml
  def update
    @twitter_trend = TwitterTrend.find(params[:id])

    respond_to do |format|
      if @twitter_trend.update_attributes(params[:twitter_trend])
        flash[:notice] = 'TwitterTrend was successfully updated.'
        format.html { redirect_to(@twitter_trend) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @twitter_trend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_trends/1
  # DELETE /twitter_trends/1.xml
  def destroy
    @twitter_trend = TwitterTrend.find(params[:id])
    @twitter_trend.destroy

    respond_to do |format|
      format.html { redirect_to(twitter_trends_url) }
      format.xml  { head :ok }
    end
  end
end
