require 'rails_helper'

describe 'user sees a specific job' do
  it 'a user sees a job for a specific company' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'sports')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)

    visit job_path(job)

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
  end

  it 'user can go to the job edit page' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'sports')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)

    visit job_path(job)

    click_on 'Edit'

    expect(current_path).to eq(edit_job_path(job))
  end

  it 'user can delete a job' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'sports')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)

    visit job_path(job)

    click_on 'Delete'

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to_not have_content(job.title)
  end
end
