class WorkRequestsController < ApplicationController
  # GET /work_requests
  # GET /work_requests.json

  layout "headquarters"


  def index
    @work_requests = WorkRequest.all

  end





  def create
    @work_request = WorkRequest.new(params[:work_request])

      if @work_request.save
        redirect root_url
      else
        redirect app_home_url
      end
  end

  # PUT /work_requests/1
  # PUT /work_requests/1.json

end
