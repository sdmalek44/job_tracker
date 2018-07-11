require 'rails_helper'

describe 'user visits /companies/#/jobs/#' do
  it 'user can delete a job' do
    company = Company.create!(name: 'Best Buy')
    category = Category.create!(title: "sports")
    job_1 = company.jobs.create!(title: 'Cashier', level_of_interest: 12, city: 'Denver', category_id: category.id)

    visit job_path(job_1)
    click_on 'Delete'

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("You successfully deleted #{job_1.title}")
  end
end
