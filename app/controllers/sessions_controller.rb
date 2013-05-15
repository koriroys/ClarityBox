class SessionsController < ApplicationController

  def new
  end

  def create
    u = User.find_by_email(params[:email])

      if u.present? && u.authenticate(params[:password])
        session[:user_id] = u.id
        redirect_to weeks_url, notice: 'Sign in successful.'

      else
        redirect_to new_session_url, notice: 'Nice try.'
      end

    end


  def destroy
    reset_session
    redirect_to responses_url, notice: 'Sign out successful'
  end
end
