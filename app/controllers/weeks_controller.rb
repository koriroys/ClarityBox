class WeeksController < ApplicationController

  def index
    @weeks = Week.all
  end

  def show
    @week = Week.find_by_id(params[:id])
  end

  def new
    @week = Week.new
  end

  def create
    @week = Week.new
    @week.week_number = params[:week_number]
    @week.week_start = params[:week_start]
    @week.week_stop = params[:week_stop]

    if @week.save
            redirect_to weeks_url
          else
      render 'new'
    end
  end

  def edit
    @week = Week.find_by_id(params[:id])
  end

  def update
    @week = Week.find_by_id(params[:id])
    @week.week_number = params[:week_number]
    @week.week_start = params[:week_start]
    @week.week_stop = params[:week_stop]

    if @week.save
            redirect_to weeks_url
          else
      render 'edit'
    end
  end

  def destroy
    @week = Week.find_by_id(params[:id])
    @week.destroy
        redirect_to weeks_url
      end
end
