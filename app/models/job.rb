class Job < ApplicationRecord
  validates_presence_of :title, :level_of_interest, :city
  belongs_to :company
  belongs_to :category
  has_many :comments


  def self.count_levels_of_interest
    all.order(level_of_interest: :desc).group(:level_of_interest).count
  end

  def self.jobs_by_city
    group(:city).count
  end
end
