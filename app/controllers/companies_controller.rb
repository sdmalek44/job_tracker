class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash.now("#{company} saved!")
      redirect company_path(@company)
    else
      render :new
    end
  end

  def show
    company = Company.find(params[:id])
    redirect_to company_jobs_path(company)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.update(company_params)
    if @company.save
      redirect company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.delete

    redirect companies_path
  end


  private

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
