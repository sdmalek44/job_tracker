require 'rails_helper'

describe 'User creates a new company' do
  it 'a user can create a new company' do
    visit new_company_path

    fill_in :company_name, with: 'ESPN'
    click_button 'Create'

    expect(current_path).to eq(company_path(1))
    expect(page).to have_content('ESPN')
  end

  it 'a user cannot create a company without entering a name' do
    visit new_company_path

    click_button 'Create'

    expect(current_path).to eq(new_company_path)
    expect(page).to have_content('Please enter a name for your company')
  end

  it 'clicking cancel takes user back to the company index' do
    visit new_company_path

    click_on 'Cancel'

    expect(current_path).to eq(companies_path)
  end
end
