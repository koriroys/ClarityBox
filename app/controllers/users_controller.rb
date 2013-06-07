class UsersController < ApplicationController
  before_filter :authorize_any_user, only: [:show, :edit, :update]
  before_filter :require_super_admin, only: [:destroy]
  before_filter :require_super_admin_or_admin, only: [:new, :invite_new]


  def authorize_any_user
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_url(current_user), notice: "Nice try, you're not allowed to edit another person's profile."
    end
  end

  def require_super_admin_or_admin
    unless admin? || super_admin?
      redirect_to user_url(current_user), notice: "You're not authorized to view that."
    end
  end



  def invite_new
    @user = User.new
  end

  def index
    @users = User.all
    @company = current_user.company

  end


  def show
    @responses = Response.where(:user_id => params[:id])
    @user = User.find_by_id(params[:id])
    @question_for_this_week = Question.get_this_week_and_company(current_user.company_id)
  end


  def new
    @user = User.new
  end


  def create
    # raise params.inspect
    @user = User.new(params[:user])

    # if params[:employee_invite] == true
      temp_pass = User.generate_password
      @user.password = temp_pass
      @user.password_confirmation = temp_pass
    # end

    if @user.save
      # UserMailer.registration_confirmation(@user).deliver
      UserMailer.employee_invite_request(@user, current_user, temp_pass).deliver
      redirect_to app_home_url, :notice => "Invite sent."
    else
      redirect_to invite_new_url, :notice => "Invite was not sent."
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



