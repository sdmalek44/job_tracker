class DashboardController < ApplicationController

  def analysis
    @interest_levels = Job.count_levels_of_interest
    render :dashboard
  end
end
