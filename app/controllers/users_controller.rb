class UsersController < ApplicationController
  before_filter :authorize_any_user, only: [:show]
  before_filter :require_super_admin, only: [:edit, :update, :destroy]


  def authorize_any_user
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_url(current_user), notice: 'Nice try'
    end
  end



  def index
    @users = User.all

  end

  def show
    @responses = Response.where(:user_id => params[:id])
    @user = User.find_by_id(params[:id])
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
      redirect_to company_url(@user.company), :notice => "User created."
    else
      redirect_to new_user_url, :notice => "Email address taken."
    end
  end



  def edit
    @user = User.find_by_id(params[:id])
  end


  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])

    if @user.save
      redirect_to users_url, :notice => "User updated."
    else
      redirect_to edit_user_url(@user.id), :notice => "Your changes were not saved."
    end

  end


  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
      redirect_to users_url
    end
  end

