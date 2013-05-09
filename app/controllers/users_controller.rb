class UsersController < ApplicationController


  def index
    @users = User.all

  end



  def show

  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    # raise @user.inspect

    if @user.save
            redirect_to users_url
          else
      render 'new'
    end
  end




  def edit

  end


  def update

  end


  def destroy

  end

end
