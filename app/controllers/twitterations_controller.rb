class TwitterationsController < ApplicationController
  # GET /twitterations
  # GET /twitterations.xml
  def index
    @twitterations = Twitterations.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @twitterations }
    end
  end

  # GET /twitterations/1
  # GET /twitterations/1.xml
  def show
    @twitterations = Twitterations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @twitterations }
    end
  end

  # GET /twitterations/new
  # GET /twitterations/new.xml
  def new
    @twitterations = Twitterations.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @twitterations }
    end
  end

  # GET /twitterations/1/edit
  def edit
    @twitterations = Twitterations.find(params[:id])
  end

  # POST /twitterations
  # POST /twitterations.xml
  def create
    @twitterations = Twitterations.new(params[:twitterations])

    respond_to do |format|
      if @twitterations.save
        flash[:notice] = 'Twitterations was successfully created.'
        format.html { redirect_to(@twitterations) }
        format.xml  { render :xml => @twitterations, :status => :created, :location => @twitterations }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @twitterations.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /twitterations/1
  # PUT /twitterations/1.xml
  def update
    @twitterations = Twitterations.find(params[:id])

    respond_to do |format|
      if @twitterations.update_attributes(params[:twitterations])
        flash[:notice] = 'Twitterations was successfully updated.'
        format.html { redirect_to(@twitterations) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @twitterations.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /twitterations/1
  # DELETE /twitterations/1.xml
  def destroy
    @twitterations = Twitterations.find(params[:id])
    @twitterations.destroy

    respond_to do |format|
      format.html { redirect_to(twitterations_url) }
      format.xml  { head :ok }
    end
  end
end
