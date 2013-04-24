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
    @all = Question.all

  end


  def show
    @each = Question.find_by_week_number(params[:week_number])

  end

  def edit
    @week_number = params[:week_number]
    @each = Question.find_by_week_number(params[:week_number])
  end

  def update
    q = Question.find_by_week_number(params[:week_number])
    q.week_number = params[:week_number]
    q.week_start = params[:week_start]
    q.week_end = params[:week_end]
    q.question =params[:question]
    q.save

    redirect_to "/question/wk#{params[:week_number]}"
  end

end
