class Company < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three_by_average_interest
    select('companies.*, avg(jobs.level_of_interest) AS avg_level_of_interest')
    .joins(:jobs)
    .order('avg(jobs.level_of_interest) desc')
    .group(:company_id, :id)
    .limit(3)
  end
end
