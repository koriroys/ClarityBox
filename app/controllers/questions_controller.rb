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
    @question.question_text = params[:question_text]
    @question.week_id = params[:week_id]

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
