class CompaniesController < ApplicationController
  before_filter :require_signed_in_user

  def require_signed_in_user
    unless signed_in?
      redirect_to new_session_url, notice: 'Must be signed in for that'
    end
  end


  def index
    @companies = Company.all
  end

  def show
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
