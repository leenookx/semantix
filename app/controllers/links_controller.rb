class LinksController < ApplicationController
  # GET /links
  # GET /links.xml
  def index
    @links = Links.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # GET /links/1
  # GET /links/1.xml
  def show
    @links = Links.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # GET /links/new
  # GET /links/new.xml
  def new
    @links = Links.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # GET /links/1/edit
  def edit
    @links = Links.find(params[:id])
  end

  # POST /links
  # POST /links.xml
  def create
    @links = Links.new(params[:links])

    respond_to do |format|
      if @links.save
        flash[:notice] = 'Links was successfully created.'
        format.html { redirect_to(@links) }
        format.xml  { render :xml => @links, :status => :created, :location => @links }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @links.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.xml
  def update
    @links = Links.find(params[:id])

    respond_to do |format|
      if @links.update_attributes(params[:links])
        flash[:notice] = 'Links was successfully updated.'
        format.html { redirect_to(@links) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @links.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    @links = Links.find(params[:id])
    @links.destroy

    respond_to do |format|
      format.html { redirect_to(links_url) }
      format.xml  { head :ok }
    end
  end
end
