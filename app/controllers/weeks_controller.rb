class WeeksController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :require_super_admin?


  def require_signed_in_user
    unless signed_in?
      redirect_to new_session_url, notice: 'Must be signed in for that'
    end
  end


  def require_super_admin?
    unless super_admin?
      redirect_to root_url, notice: "You're not a super admin and authorized to view this"
    end
  end


  def index
    @weeks = Week.all
  end

  def show
    @week = Week.find_by_id(params[:id])
  end

end
