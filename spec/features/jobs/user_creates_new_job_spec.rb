require 'rails_helper'

describe "User visits /companies/#/jobs/new" do
  it "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "sports")
    visit new_company_job_path(company)

    select category.title, from: 'job[category_id]'
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    select 1, from: "job[level_of_interest]"
    fill_in "job[city]", with: "Denver"

    click_button "Create Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("1")
    expect(page).to have_content("Denver")
  end

  it 'user can create a new category' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "sports")
    visit new_company_job_path(company)

    click_on 'add new category'

    expect(current_path).to eq(new_category_path)
  end

  it 'if user doesnt enter all required info it redirects back to /new' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "sports")
    visit new_company_job_path(company)

    select category.title, from: 'job[category_id]'
    fill_in "job[description]", with: "So fun!"
    select 1, from: "job[level_of_interest]"
    fill_in "job[city]", with: "Denver"

    click_on "Create Job"

    expect(current_path).to eq(new_company_job_path(company))
    expect(page).to have_content("Please pass in all required fields")
  end
end
