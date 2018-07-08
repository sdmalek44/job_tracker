class DashboardController < ApplicationController

  def analysis
    @interest_levels = Job.count_levels_of_interest
    @top_3_companies = [1, 2, 3]
    @jobs_by_city = Job.jobs_by_city
    render :dashboard
  end
end
