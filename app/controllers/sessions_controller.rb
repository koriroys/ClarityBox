class SessionsController < ApplicationController



  def new
  end

  def create
    u = User.find_by_email(params[:email])

      if u.present? && u.authenticate(params[:password])
        session[:user_id] = u.id
        redirect_to app_home_url, notice: "You've signed in successfully."
      else
       redirect_to new_session_url, notice: 'Please try signing in again.'
      end

    end


  def destroy
    reset_session
    redirect_to app_home_url, notice: "Thanks for stopping by."
  end
end
