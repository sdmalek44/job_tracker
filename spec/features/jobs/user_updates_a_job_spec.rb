require 'rails_helper'

describe 'when visiting /jobs/#' do
  describe 'user wants to update a job' do
    it 'can visit an edit page for that job' do
      company = Company.create!(name: 'Best Buy')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'Cashier', level_of_interest: 12, city: 'Denver', category_id: category.id)

      visit job_path(job)
      click_on 'Edit'

      expect(current_path).to eq(edit_job_path(job))
    end

    it 'user can update a job through the edit page' do
      company = Company.create!(name: 'Best Buy')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'Cashier', description: 'Sales', level_of_interest: 12, city: 'Denver', category_id: category.id)

      visit edit_job_path(job)

      fill_in :job_title, with: 'Janitor'
      fill_in :job_description, with: 'Cleaning'
      select 1, from: :job_level_of_interest
      fill_in :job_city, with: 'San Diego'
      click_on 'Update Job'

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("You updated Janitor at #{company.name}")
      expect(page).to have_content("Janitor at #{company.name}")
      expect(page).to have_content('Description: Cleaning')
      expect(page).to have_content('Level of Interest: 1')
      expect(page).to have_content('City: San Diego')
    end

    it 'user can see notice with invalid inputs ' do
      company = Company.create!(name: 'Best Buy')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'Cashier', description: 'Sales', level_of_interest: 12, city: 'Denver', category_id: category.id)

      visit edit_job_path(job)

      fill_in :job_title, with: ''
      fill_in :job_description, with: 'Cleaning'
      select 1, from: :job_level_of_interest
      fill_in :job_city, with: 'San Diego'
      click_on 'Update Job'

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content('Invalid Input')
    end

    it 'clicking cancel takes user back to the jobs show page' do
      company = Company.create!(name: 'Best Buy')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'Cashier', description: 'Sales', level_of_interest: 12, city: 'Denver', category_id: category.id)

      visit edit_job_path(job)

      click_on 'Cancel'

      expect(current_path).to eq(job_path(job))
    end
  end
end
