class TwitterTrendHeadsController < ApplicationController
  # GET /twitter_trend_heads
  # GET /twitter_trend_heads.xml
  def index
    @twitter_trend_heads = TwitterTrendHead.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @twitter_trend_heads }
    end
  end

  # GET /twitter_trend_heads/1
  # GET /twitter_trend_heads/1.xml
  def show
    @twitter_trend_head = TwitterTrendHead.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @twitter_trend_head }
    end
  end

  # GET /twitter_trend_heads/new
  # GET /twitter_trend_heads/new.xml
  def new
    @twitter_trend_head = TwitterTrendHead.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @twitter_trend_head }
    end
  end

  # GET /twitter_trend_heads/1/edit
  def edit
    @twitter_trend_head = TwitterTrendHead.find(params[:id])
  end

  # POST /twitter_trend_heads
  # POST /twitter_trend_heads.xml
  def create
    @twitter_trend_head = TwitterTrendHead.new(params[:twitter_trend_head])

    respond_to do |format|
      if @twitter_trend_head.save
        flash[:notice] = 'TwitterTrendHead was successfully created.'
        format.html { redirect_to(@twitter_trend_head) }
        format.xml  { render :xml => @twitter_trend_head, :status => :created, :location => @twitter_trend_head }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @twitter_trend_head.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_trend_heads/1
  # PUT /twitter_trend_heads/1.xml
  def update
    @twitter_trend_head = TwitterTrendHead.find(params[:id])

    respond_to do |format|
      if @twitter_trend_head.update_attributes(params[:twitter_trend_head])
        flash[:notice] = 'TwitterTrendHead was successfully updated.'
        format.html { redirect_to(@twitter_trend_head) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @twitter_trend_head.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_trend_heads/1
  # DELETE /twitter_trend_heads/1.xml
  def destroy
    @twitter_trend_head = TwitterTrendHead.find(params[:id])
    @twitter_trend_head.destroy

    respond_to do |format|
      format.html { redirect_to(twitter_trend_heads_url) }
      format.xml  { head :ok }
    end
  end
end
