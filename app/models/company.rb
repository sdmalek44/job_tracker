class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three_by_average_interest
    select("jobs.*, AVG(level_of_interest) AS avg_level_of_interest")
    .joins(:jobs)
    .group(:company_id, :id)
    .order("avg_level_of_interest DESC")
    .limit(3)
  end
end
