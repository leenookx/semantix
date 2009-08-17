class CalaisservicesController < ApplicationController

  # GET /calaisservices
  # GET /calaisservices.xml
  def index
    @calais = Calaisservice.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calais }
    end
  end

  # GET /calaisservices/1
  # GET /calaisservices/1.xml
  # GET /calaisservices/2.json
  def show
    @calais = Calaisservice.new

    respond_to do |format|
      format.xml  { render :xml => @calais }
      format.json { render :json => @calais }
    end
  end

  # GET /calaisservices/new
  # GET /calaisservices/new.xml
  def new

    respond_to do |format|
      format.all  { render_501 }
    end
  end

  # GET /calaisservices/1/edit
  def edit

    respond_to do |format|
      format.all  { render_501 }
    end
  end

  # POST /calaisservices
  # POST /calaisservices.xml
  def create

    respond_to do |format|
      format.all  { render_501 }
    end
  end

  # PUT /calaisservices/1
  # PUT /calaisservices/1.xml
  def update

    respond_to do |format|
      format.all  { render_501 }
    end
  end

  # DELETE /calaisservices/1
  # DELETE /calaisservices/1.xml
  def destroy

    respond_to do |format|
      format.all  { render_501 }
    end
  end
end

