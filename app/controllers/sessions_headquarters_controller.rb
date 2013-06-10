class SessionsHeadquartersController < ApplicationController

  layout "headquarters"

  def new
  end

  def create
    u = User.find_by_email(params[:email])

      if u.present? && u.authenticate(params[:password])
        session[:user_id] = u.id && u.user_role == 'Super Admin'
        redirect_to posts_url, notice: "You've signed in successfully."

      else
       redirect_to new_session_hq_url, notice: 'Please try signing in again.'
      end

    end


  def destroy
    reset_session
    redirect_to root_url
  end
end
