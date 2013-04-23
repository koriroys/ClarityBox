class AppController < ApplicationController
  
  def new_question_form

  end

  def create_new_question
  	q = Question.new
  	q.week_number = params[:week_number]
  	q.week_start = params[:week_start]
  	q.week_end = params[:week_end]
  	q.question = params[:question]

  	q.save

  	@week = Question.find_by_week_number(params[:week_number])


  end

  def view_rollup

  	@week = Question.find_by_week_number(params[:week_number])

  end



end
