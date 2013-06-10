class AppRequestsController < ApplicationController
  before_filter :require_signed_in_user, only: [:index]
  before_filter :require_super_admin, only: [:index]

  # GET /app_requests
  # GET /app_requests.json
  def index
    @app_requests = AppRequest.all(:order => "created_at DESC")

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


  def create
    @app_request = AppRequest.new(params[:app_request])

    if @app_request.save
      UserMailer.app_invite_request(@app_request).deliver
      UserMailer.app_invite_notification(@app_request).deliver
      redirect_to thanks_url

    else
      render 'new', notice: "Woops, try submitting your request again."

  end



end
end
