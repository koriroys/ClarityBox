class ApplicationController < ActionController::Base


  protect_from_forgery

  helper_method :signed_in?
  helper_method :current_user
  helper_method :super_admin?
  helper_method :admin?
  helper_method :general_user?



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

  def general_user?
    current_user.user_role == 'General'
  end


  def require_signed_in_user
    unless signed_in?
      redirect_to new_session_url, notice: 'Must be signed in for that.'
    end
  end


  def require_super_admin
    unless super_admin?
      redirect_to root_url, notice: "You're not a super admin."
    end
  end


  def permit_only_company_user_or_super_admin
      unless (current_user.company_id == params[:company_id]) || super_admin?
      redirect_to company_url(current_user.company_id), notice: "That's not your company."
    end
  end


end
