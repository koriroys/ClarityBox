class CompaniesController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :require_super_admin, only: [:index, :create, :new, :destroy]
  before_filter :permit_only_company_user, only: [:show]
  before_filter :require_company_admin, only: [:edit, :update]



  def permit_only_company_user
    unless (current_user.company_id.to_s == params[:id]) || super_admin?
      redirect_to company_url(current_user.company), notice: 'That was not your company.'
    end
  end

  def require_company_admin
    unless (admin? && (current_user.company_id.to_s == params[:id])) || super_admin?
      redirect_to root_url, notice: "That's not your company."
    end
  end


  def index
    @companies = Company.all
  end

  def show
      @company = Company.find_by_id(params[:id])
  end

  def rollups
    @company = Company.find_by_id(params[:id])


  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])

    if @company.save
      redirect_to company_url(@company)
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find_by_id(params[:id])

  end

  def update
    @company = Company.find_by_id(params[:id])

    if @company.update_attributes(params[:company])
      redirect_to company_url(@company)
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find_by_id(params[:id])
    @company.destroy
      redirect_to companies_url
  end

end
