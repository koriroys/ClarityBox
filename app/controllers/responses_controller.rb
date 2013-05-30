class ResponsesController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :get_question
  before_filter :authorize_user, only: [:show, :edit, :update, :destroy]




   def authorize_user
    @response = Response.find(params[:id])

    if @response.user != current_user
      redirect_to questions_url, notice: "Nice try. You're not allowed to touch someone else's response."
    end
  end


  def index
    # @responses = Response.all
    # @responses = Response.find_all_by_question_id(params[:question])

    # @response = Response.find_by_question_id(params[:question_id])
    @question = Question.find_by_id(params[:question_id])
    unless (current_user.company_id == @question.company_id) || super_admin?
    redirect_to company_url(current_user.company_id), notice: "That's not your company's rollup."
    end
    @responses = Response.where(:question_id => params[:question_id])


    if @responses.any?
      @user_response = @responses.find_by_user_id(current_user)
      @yes_count = @responses.where(:yes_response => true).count
      @no_count = @responses.where(:yes_response => false).count
      @users = User.where(:company_id => current_user.company_id)
    end

  end

  def show
    @response = Response.find_by_id(params[:id])


  end

  def new
    @question = Question.find(params[:question_id])
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
