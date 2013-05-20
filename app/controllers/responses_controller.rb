class ResponsesController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :get_question

  def require_signed_in_user
    unless signed_in?
      redirect_to new_session_url, notice: 'Must be signed in for that'
    end
  end

  def index
    @responses = Response.all
  end

  def show
    @response = Response.find_by_id(params[:id])
  end

  def new
    @response = Response.new
    # @response.question_id = 1
    # @response.user_id = session[:user_id]
  end

  def create
    # raise params.inspect
    @response = @question.responses.new(params[:response])
    @response.user_id = session[:user_id]

    if @response.save
            redirect_to question_response_url(@question, @response)
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
            redirect_to question_response_url(@question, @response)
          else
      render 'edit'
    end
  end

  def destroy
    @response = Response.find_by_id(params[:id])
    @response.destroy
        redirect_to question_responses_url(@question)
  end

  private

  def get_question
    @question = Question.find_by_id(params[:question_id])
  end
end
