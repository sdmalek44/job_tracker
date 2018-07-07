class AddCategoryIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :category, foreign_key: true
  end
end
