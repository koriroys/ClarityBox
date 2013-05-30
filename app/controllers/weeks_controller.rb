class WeeksController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :require_super_admin



  def index
    @weeks = Week.all
    @companies = Company.all
    @questions = Question.all
  end

  def show
    @week = Week.find_by_id(params[:id])
  end

end
