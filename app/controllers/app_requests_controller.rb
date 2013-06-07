class AppRequestsController < ApplicationController
  before_filter :require_super_admin, only: [:index, :edit, :destroy]

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

  def thanks
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
    redirect_to thanks_url

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
