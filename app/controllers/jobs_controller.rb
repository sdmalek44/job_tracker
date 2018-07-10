class JobsController < ApplicationController

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
    @job = Job.update(params[:id], job_params)
    if @job.save
      flash[:success] = "You updated #{@job.title} at #{@job.company.name}"
      redirect_to job_path(@job)
    else
      flash.notice = "Please pass in all required fields"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
