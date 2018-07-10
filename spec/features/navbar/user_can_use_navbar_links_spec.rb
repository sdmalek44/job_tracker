require 'rails_helper'

describe 'Navbar' do
  it 'user can go to Dashboard' do
    visit companies_path

    click_on 'Dashboard'

    expect(current_path).to eq(dashboard_path)
  end

  it 'user can go to Companies' do
    visit jobs_path

    click_on 'Companies'

    expect(current_path).to eq(companies_path)
  end

  it 'user can go to Jobs' do
    visit companies_path

    click_on 'Jobs'

    expect(current_path).to eq(jobs_path)
  end

  it 'user can go to Categories' do
    visit companies_path

    click_on 'Categories'

    expect(current_path).to eq(categories_path)
  end
end
