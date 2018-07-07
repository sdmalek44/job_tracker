require 'rails_helper'

describe 'features' do
  describe 'user visits /companies/#/jobs/#' do
    it 'user can delete a job' do
      company = Company.create!(name: 'Best Buy')
      category = Category.create!(title: "sports")
      job_1 = company.jobs.create!(title: 'Cashier', level_of_interest: 12, city: 'Denver', category_id: category.id)
      job_2 = company.jobs.create!(title: 'Janitor', level_of_interest: 67, city: 'San Diego', category_id: category.id)

      visit company_job_path(company, job_1)
      click_on 'Delete'

      expect(current_path).to eq(company_jobs_path(company))
      expect(page).to_not have_content("#{job_1.title} at #{company.name}")
      expect(page).to have_content("#{job_2.title} at #{company.name}")
    end
  end
end
