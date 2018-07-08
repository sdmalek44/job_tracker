class DashboardController < ApplicationController

  def analysis
    @interest_levels = Job.count_levels_of_interest
    @top_3_companies = [1, 2, 3]
    render :dashboard
  end
end
