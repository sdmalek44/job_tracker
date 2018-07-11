class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :edit, :destroy]

  def index
    @companies = Company.all.includes(:jobs)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      flash.notice = 'Please enter a name for your company'
      redirect_to new_company_path
    end
  end

  def show
    @contact = Contact.new
    @contacts = @company.contacts
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      flash.notice = 'Please enter a new name for your company'
      redirect_to edit_company_path(@company)
    end
  end

  def destroy
    @company.destroy
    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :city)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
