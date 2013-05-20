class QuestionsController < ApplicationController

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
    @question = Question.new
    # raise params.inspect
    @question.question_text = params[:question_text]
    @question.user_id = session[:user_id]
    @question.week_id = params[:week_id]
    # raise Week.find_by_id(params[:week_id]).inspect
    @week_datetime = Week.find_by_id(params[:week_id]).end_date.to_datetime
    @question.ask_at = @week_datetime  + 8.hours
    @question.remind_at = @week_datetime + 2.days + 20.hours
    @question.send_roll_up_at = @week_datetime + 4.days + 8.hours
    @question.company_id = params[:company_id]

    if @question.save
      redirect_to questions_url
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
    @question = Question.find_by_id(params[:id])
    @question.question_text = params[:question_text]
    @question.week_id = params[:week_id]
    @question.company_id = params[:company_id]
    @week_datetime = Week.find_by_id(params[:week_id]).end_date.to_datetime
    @question.ask_at = @week_datetime  + 8.hours
    @question.remind_at = @week_datetime + 2.days + 20.hours
    @question.send_roll_up_at = @week_datetime + 4.days + 8.hours

    if @question.save
      redirect_to questions_url
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find_by_id(params[:id])
    @question.destroy
    redirect_to questions_url
  end
end
