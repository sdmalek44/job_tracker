class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
end
