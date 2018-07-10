require 'rails_helper'

describe 'features' do
  describe 'when visiting /jobs user' do
    it 'can see all of the jobs in the database' do
      company1 = Company.create!(name: 'NBC')
      company2 = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      job1 = company1.jobs.create!(title: 'person', level_of_interest: 10, city: 'Denver', category_id: category.id)
      job2 = company1.jobs.create!(title: 'guy', level_of_interest: 10, city: 'Denver', category_id: category.id)
      job3 = company2.jobs.create!(title: 'dude', level_of_interest: 10, city: 'Denver', category_id: category.id)

      visit jobs_path

      expect(page).to have_content(job1.title)
      expect(page).to have_content(job1.level_of_interest)
      expect(page).to have_content(job1.city)
      expect(page).to have_content(job2.title)
      expect(page).to have_content(job2.level_of_interest)
      expect(page).to have_content(job2.city)
      expect(page).to have_content(job3.title)
      expect(page).to have_content(job3.level_of_interest)
      expect(page).to have_content(job3.city)
    end

    it 'can click on a specific job to view that job show page' do
      company = Company.create!(name: 'NBC')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'person', level_of_interest: 10, city: 'Denver', category_id: category.id)

      visit jobs_path

      click_on job.title

      expect(current_path).to eq(job_path(job))
    end

    it 'user can sort jobs by location' do
      company = Company.create!(name: 'NBC')
      category = Category.create!(title: 'sports')
      job_1 = company.jobs.create!(title: 'Manager', level_of_interest: 10, city: 'Anaheim', category_id: category.id)
      job_2 = company.jobs.create!(title: 'Janitor', level_of_interest: 10, city: 'Zanzibar', category_id: category.id)

      visit jobs_path

      click_on 'Order by Location'

      expect(current_path).to eq(jobs_path)
      expect(job_1.title).to appear_before(job_2.title)
      expect(job_2.title).to appear_after(job_1.title)
    end

    it 'user can sort jobs by level of interest' do
      company = Company.create!(name: 'NBC')
      category = Category.create!(title: 'sports')
      job_1 = company.jobs.create!(title: 'Manager', level_of_interest: 1, city: 'Anaheim', category_id: category.id)
      job_2 = company.jobs.create!(title: 'Janitor', level_of_interest: 5, city: 'Zanzibar', category_id: category.id)

      visit jobs_path

      click_on 'Order by Location'

      expect(current_path).to eq(jobs_path)
      expect(job_2.title).to appear_after(job_1.title)
      expect(job_1.title).to appear_before(job_2.title)
    end

    it 'user can click to see jobs for a specific city' do
      company = Company.create!(name: 'NBC')
      category = Category.create!(title: 'sports')
      job_1 = company.jobs.create!(title: 'Manager', level_of_interest: 1, city: 'Denver', category_id: category.id)
      job_2 = company.jobs.create!(title: 'Janitor', level_of_interest: 5, city: 'Denver', category_id: category.id)
      job_3 = company.jobs.create!(title: 'Teacher', level_of_interest: 5, city: 'Chicago', category_id: category.id)

      visit jobs_path

      click_on 'Search Location'
      click_on 'Denver'

      expect(current_path).to eq(jobs_path)
      expect(page).to have_content(job_1.title)
      expect(page).to have_content(job_2.title)
      expect(page).to_not have_content(job_3.title)
    end
  end
end
