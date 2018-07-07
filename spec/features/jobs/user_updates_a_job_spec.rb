require 'rails_helper'

describe 'features' do
  describe 'when visiting /companies/#/jobs/#' do
    describe 'user wants to update a job' do
      it 'can visit an edit page for that job' do
        company = Company.create!(name: 'Best Buy')
        job = company.jobs.create!(title: 'Cashier', level_of_interest: 12, city: 'Denver')

        visit company_job_path(company, job)
        click_on 'Edit'

        expect(current_path).to eq(edit_company_job_path(company, job))
      end

      it 'user can update a job through the edit page' do
        company = Company.create!(name: 'Best Buy')
        job = company.jobs.create!(title: 'Cashier', description: 'Sales', level_of_interest: 12, city: 'Denver')

        visit edit_company_job_path(company, job)

        fill_in 'job[title]', with: 'Janitor'
        fill_in 'job[description]', with: 'Cleaning'
        fill_in 'job[level_of_interest]', with: 67
        fill_in 'job[city]', with: 'San Diego'
        click_on 'Update Job'

        expect(current_path).to eq(company_job_path(company, job))
        expect(page).to have_content('Title: Janitor')
        expect(page).to have_content('Description: Cleaning')
        expect(page).to have_content("Level of Interest: 67")
        expect(page).to have_content("City: San Diego")
      end
    end
  end
end
