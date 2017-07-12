class AddCompanyIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :company, index: true, foreign_key: true
  end
end
