class AddCityToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :city, :string
  end
end
