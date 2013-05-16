class WeeksController < ApplicationController

  def index
    @weeks = Week.all
  end

  def show
    @week = Week.find_by_id(params[:id])
  end

end
