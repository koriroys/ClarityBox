class WorkRequestsController < ApplicationController
  before_filter :require_signed_in_user, only: [:index]
  before_filter :require_super_admin, only: [:index]

  # GET /work_requests
  # GET /work_requests.json

  layout "headquarters"


  def index
    @work_requests = WorkRequest.all

  end


  # def new
  #   @work_request = WorkRequest.new
  # end


  def create
    @work_request = WorkRequest.new(params[:work_request])

      if @work_request.save
        UserMailer.work_request_notification(@work_request).deliver
        redirect_to work_request_thanks_url
      else
        redirect_to root_url, notice: "Woops, make sure you enter an email address before submitting the form."
      end
  end

  def thanks
  end

  # PUT /work_requests/1
  # PUT /work_requests/1.json

end
