class AppRequestsController < ApplicationController
  # GET /app_requests
  # GET /app_requests.json
  def index
    @app_requests = AppRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @app_requests }
    end
  end

  # GET /app_requests/1
  # GET /app_requests/1.json
  def show
    @app_request = AppRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app_request }
    end
  end

  # GET /app_requests/new
  # GET /app_requests/new.json
  def new
    @app_request = AppRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app_request }
    end
  end

  # GET /app_requests/1/edit
  def edit
    @app_request = AppRequest.find(params[:id])
  end

  # POST /app_requests
  # POST /app_requests.json
  def create
    @app_request = AppRequest.new(params[:app_request])

    respond_to do |format|
      if @app_request.save
        format.html { redirect_to @app_request, notice: 'App request was successfully created.' }
        format.json { render json: @app_request, status: :created, location: @app_request }
      else
        format.html { render action: "new" }
        format.json { render json: @app_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /app_requests/1
  # PUT /app_requests/1.json
  def update
    @app_request = AppRequest.find(params[:id])

    respond_to do |format|
      if @app_request.update_attributes(params[:app_request])
        format.html { redirect_to @app_request, notice: 'App request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_requests/1
  # DELETE /app_requests/1.json
  def destroy
    @app_request = AppRequest.find(params[:id])
    @app_request.destroy

    respond_to do |format|
      format.html { redirect_to app_requests_url }
      format.json { head :no_content }
    end
  end
end
