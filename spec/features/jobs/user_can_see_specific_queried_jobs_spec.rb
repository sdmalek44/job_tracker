require 'rails_helper'

describe 'user visits /jobs' do
  it 'user sees all jobs in specific city' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'sports')
    job_1 = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)
    job_2 = company.jobs.create!(title: 'Progammer', level_of_interest: 71, city: 'Denver', category_id: category.id)
    job_3 = company.jobs.create!(title: 'Lawyer', level_of_interest: 72, city: 'New York City', category_id: category.id)
    job_4 = company.jobs.create!(title: 'Janitor', level_of_interest: 73, city: 'Chicago', category_id: category.id)

    visit jobs_path(location: 'Denver')

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_1.level_of_interest)
    expect(page).to have_content(job_1.city)
    expect(page).to have_content(job_2.title)
    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to have_content(job_2.city)
    expect(page).to_not have_content(job_3.title)
    expect(page).to_not have_content(job_4.title)
  end

  it 'user sees jobs ordered by location' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'sports')
    job_1 = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Atlanta', category_id: category.id)
    job_2 = company.jobs.create!(title: 'Progammer', level_of_interest: 71, city: 'Denver', category_id: category.id)
    job_3 = company.jobs.create!(title: 'Janitor', level_of_interest: 73, city: 'Chicago', category_id: category.id)

    visit jobs_path(sort: 'location')

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to have_content(job_3.title)

    expect(job_1.title).to appear_before(job_3.title)
    expect(job_3.title).to appear_before(job_2.title)
    expect(job_2.title).to appear_after(job_3.title)
  end

  it 'user sees jobs ordered by level of interest' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'sports')
    job_1 = company.jobs.create!(title: 'Developer', level_of_interest: 1, city: 'Atlanta', category_id: category.id)
    job_2 = company.jobs.create!(title: 'Progammer', level_of_interest: 2, city: 'Denver', category_id: category.id)
    job_3 = company.jobs.create!(title: 'Janitor', level_of_interest: 3, city: 'Chicago', category_id: category.id)

    visit jobs_path(sort: 'interest')


    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to have_content(job_3.title)

    expect(job_3.title).to appear_before(job_2.title)
    expect(job_2.title).to appear_before(job_1.title)
    expect(job_1.title).to appear_after(job_2.title)
  end
end
