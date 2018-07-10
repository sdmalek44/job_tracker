class DashboardController < ApplicationController

  def index
    @interest_levels = Job.count_levels_of_interest
    @top_3_companies = Company.top_three_by_average_interest
    @jobs_by_city = Job.jobs_by_city
    render :dashboard
  end
end
