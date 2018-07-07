require 'rails_helper'

describe 'features' do
  describe 'when visiting /companies/#/jobs/#' do
    it 'can update a job for a company' do
      company = Company.create!(name: 'Best Buy')
      job = company.jobs.create!(title: 'Cashier', level_of_interest: 12, city: 'Denver')

      visit company_job_path(company, job)
      click_on 'Edit'

      expect(current_path).to eq(edit_company_job_path(company, job))
    end
  end
end
