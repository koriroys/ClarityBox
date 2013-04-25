class QuestionController < ApplicationController

  def new
  end


  def create
    q = Question.new
    q.week_number = params[:week_number]
    q.week_start = params[:week_start]
    q.week_end = params[:week_end]
    q.question =params[:question]
    q.save

    redirect_to "/question"

  end

  def index
    @questions = Question.all

  end


  def show
    @each = Question.find_by_id(params[:id])

  end

  def edit
    # @week_number = params[:week_number]
    @question_content = Question.find_by_id(params[:id])
    # @week_number = @question_content.week_number
  end

  def update
    q = Question.find_by_id(params[:id])
    q.week_number = params[:week_number]
    q.week_start = params[:week_start]
    q.week_end = params[:week_end]
    q.question =params[:question]
    q.save

    redirect_to "/question/#{params[:id]}"
  end

  def destroy
    q = Question.find_by_id(params[:id])
    q.destroy
    redirect_to "/question"

  end

end
