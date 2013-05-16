class CompaniesController < ApplicationController

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
    @company = Company.new
    @company.name = params[:name]

    if @company.save
      redirect_to companies_url
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find_by_id(params[:id])

  end

  def update
    @company = Company.find_by_id(params[:id])
    @company.name = params[:name]

    if @company.save
      redirect_to companies_url
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
