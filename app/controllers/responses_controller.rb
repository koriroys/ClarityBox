class ResponsesController < ApplicationController

  def index
    @responses = Response.all
  end

  def show
    @responses = Response.find_by_id(params[:id])
  end

  def new
    @response = Response.new
  end

  def create
    # raise params.inspect
    @response = Response.new
    @response.response_text = params[:response_text]
    @response.user_name= params[:user_name]
    @response.question_id = params[:question_id]

    if @response.save
            redirect_to week_url(@response.question.week_id)
          else
      render 'new'
    end
  end

  def edit
    @response = Response.find_by_id(params[:id])
  end

  def update
    @response = Response.find_by_id(params[:id])
    @response.response_text = params[:response_text]
    @response.user_name= params[:user_name]
    @response.question_id = params[:question_id]

    if @response.save
            redirect_to week_url(@response)
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
