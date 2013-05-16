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
    # raise params[:user].inspect
    @user = User.new(params[:user])
    # @user.email = params[:user][:email]
    # @user.password = params[:password]
    # @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to users_url, :notice => "User created."
    else
      redirect_to new_user_url, :notice => "Username taken."
    end
  end



  def edit
    @user = User.find_by_id(params[:id])
  end


  def update
    @user = User.find_by_id(params[:id])
    @user.email = params[:email]

    if @user.save
      redirect_to users_url, :notice => "User updated."
    else
      redirect_to edit_user_url(@user.id), :notice => "Username taken."
    end
  end

  end


  def destroy

  end

