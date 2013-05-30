class QuestionsController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :require_super_admin_or_admin, except: [:show]
  # before_filter :permit_only_company_user, only: [:show]
  # before_filter :require_company_admin, only: [:edit, :update]


  def require_super_admin_or_admin
    unless admin? || super_admin?
      redirect_to root_url, notice: "You're not an admin."
    end
  end

  # def permit_only_company_user
  #   unless current_user.company_id.to_s == params[:company_id] || super_admin?
  #     redirect_to questions_url, notice: "This is not your company!"
  #     end
  #   end

  #   def require_company_admin
  #   unless (admin? && (current_user.company_id.to_s == params[:company_id])) || super_admin?
  #     redirect_to questions_url, notice: "That's not your company."
  #   end
  # end


  def index
    @questions = Question.all

  end

  def show
    @question = Question.find_by_id(params[:id])

  end

  def new
    @question = Question.new
  end

  def create
    # raise params.inspect
    @question = Question.new(params[:question])
    # @question.question_text = params[:question][:question_text]
    # @question.user_id = session[:question][:user_id]
    # @question.week_id = params[:question][:week_id]
    @week_datetime = Week.find_by_id(params[:question][:week_id]).end_date.to_datetime
    @question.ask_at = @week_datetime  + 8.hours
    @question.remind_at = @week_datetime + 2.days + 20.hours
    @question.send_roll_up_at = @week_datetime + 4.days + 8.hours
    # @question.company_id = params[:question][:company_id]
    # @question.send_question = params[:question][:send_question]
    # @question.send_reminder = params[:question][:send_reminder]
    # @question.send_rollup = params[:question][:send_rollup]

    if @question.save
      redirect_to question_url(@question)
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
    @question = Question.find_by_id(params[:id])
    @question.question_text = params[:question][:question_text]
    @question.user_id = session[:user_id]
    @question.week_id = params[:question][:week_id]
    @question.company_id = params[:question][:company_id]
    @week_datetime = Week.find_by_id(params[:question][:week_id]).end_date.to_datetime
    @question.ask_at = @week_datetime  + 8.hours
    @question.remind_at = @week_datetime + 2.days + 20.hours
    @question.send_roll_up_at = @week_datetime + 4.days + 8.hours
    @question.send_question = params[:question][:send_question]
    @question.send_reminder = params[:question][:send_reminder]
    @question.send_rollup = params[:question][:send_rollup]

    # raise @question.user.present?.inspect
    if @question.save
      redirect_to question_url(@question)
    else
      # raise @question.valid?.inspect
      render 'edit'
    end
  end

  def destroy
    @question = Question.find_by_id(params[:id])
    @question.destroy
    redirect_to questions_url
  end
end
