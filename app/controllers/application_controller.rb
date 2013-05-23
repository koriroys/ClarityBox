class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?
  helper_method :current_user
  helper_method :super_admin?
  helper_method :admin?



  def signed_in?
    return session[:user_id].present?
  end

  def current_user
    return User.find_by_id(session[:user_id])
  end

  def super_admin?
    current_user.user_role == 'Super Admin'
  end

  def admin?
    current_user.user_role == 'Admin'
  end

  def require_super_admin
    unless super_admin?
      redirect_to root_url, notice: "You're not a super admin and authorized to view this"
    end
  end

end
