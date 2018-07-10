require 'rails_helper'

describe 'features' do
  describe 'when visiting /companies/#/jobs/#' do
    describe 'user wants to update a job' do
      it 'can visit an edit page for that job' do
        company = Company.create!(name: 'Best Buy')
        category = Category.create!(title: "sports")
        job = company.jobs.create!(title: 'Cashier', level_of_interest: 12, city: 'Denver', category_id: category.id)

        visit job_path(job)
        click_on 'Edit'

        expect(current_path).to eq(edit_job_path(job))
      end

      it 'user can update a job through the edit page' do
        company = Company.create!(name: 'Best Buy')
        category = Category.create!(title: "sports")
        job = company.jobs.create!(title: 'Cashier', description: 'Sales', level_of_interest: 12, city: 'Denver', category_id: category.id)

        visit edit_job_path(job)

        fill_in 'job[title]', with: 'Janitor'
        fill_in 'job[description]', with: 'Cleaning'
        select 1, from: 'job[level_of_interest]'
        fill_in 'job[city]', with: 'San Diego'
        click_on 'Update Job'

        expect(current_path).to eq(job_path(job))
        expect(page).to have_content('Title: Janitor')
        expect(page).to have_content('Description: Cleaning')
        expect(page).to have_content("Level of Interest: 1")
        expect(page).to have_content("City: San Diego")
      end
    end
  end
end
