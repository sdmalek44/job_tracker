class JobsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
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
      redirect_to company_job_path(@company, @job)
    else
      flash.notice = "Please pass in all required fields"
      redirect_to new_company_job_path(@company)
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = @job.company
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path(@job.company)
  end

  def all_jobs
    if params[:sort] == "interest"
      @jobs = Job.order(level_of_interest: :desc)
    elsif params[:sort]
      @jobs = Job.order(:city)
    elsif params[:location]
      @jobs = Job.where(city: params[:location].titleize)
    else
      @jobs = Job.all
    end
    render :all_jobs
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
