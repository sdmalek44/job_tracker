class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :edit, :destroy]

  def index
    @cities = Job.distinct.pluck(:city)
    @companys = Company.all
    if params[:sort] == "interest"
      @jobs = Job.order(level_of_interest: :desc)
    elsif params[:sort]
      @jobs = Job.order(:city)
    elsif params[:location]
      @jobs = Job.where(city: params[:location].titleize)
    elsif params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = Job.where(company_id: params[:company_id])
      render :company_jobs_index
    else
      @jobs = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to job_path(@job)
    else
      flash.notice = "Please pass in all required fields"
      render :new
    end
  end

  def show
    @company = @job.company
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = @job.company
  end

  def update
    @job.update(job_params)
    flash[:success] = "You updated #{@job.title} at #{@job.company.name}"
    redirect_to job_path(@job)
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
