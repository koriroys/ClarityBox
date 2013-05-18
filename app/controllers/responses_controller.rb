class ResponsesController < ApplicationController

  def index
    @responses = Response.all
  end

  def show
    @response = Response.find_by_id(params[:id])
  end

  def new
    @response = Response.new
    # @response.question_id = params[:question_id]
    # @response.user_id = session[:user_id]
  end

  def create
    # raise params.inspect
    @response = Response.new(params[:response])


    if @response.save
            redirect_to response_url(@response)
          else
      render 'new'
    end
  end

  def edit
    @response = Response.find_by_id(params[:id])
  end

  def update
    @response = Response.find_by_id(params[:id])

    if  @response.update_attributes(params[:response])
            redirect_to response_url(@response)
          else
      render 'edit'
    end
  end

  def destroy
    @response = Response.find_by_id(params[:id])
    @response.destroy
        redirect_to responses_url
      end
end
