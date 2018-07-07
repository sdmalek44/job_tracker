require 'rails_helper'

describe 'features' do
  describe 'when visiting /companies/#/jobs/#' do
    it 'can create a comment for job' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'manager', level_of_interest: 10, city: 'Denver', category_id: category.id)

      visit company_job_path(company, job)

      fill_in "comment[author]", with: "joe shmo"
      fill_in "comment[body]", with: "this job is terrible"
      click_on "Submit Comment"

      expect(current_path).to eq(company_job_path(company, job))
      expect(page).to have_content("joe shmo")
      expect(page).to have_content("this job is terrible")
    end
  end
end
