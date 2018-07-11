require 'rails_helper'

describe 'User edits an existing company' do
  it 'a user can edit a company' do
    company = Company.create!(name: 'ESPN')
    visit edit_company_path(company)

    fill_in :company_name, with: 'EA Sports'
    click_button 'Update'

    expect(current_path).to eq(company_path(1))
    expect(page).to have_content('EA Sports')
    expect(page).to_not have_content('ESPN')
  end

  it 'a user cannot edit a company without entering a name' do
    company = Company.create!(name: 'ESPN')
    visit edit_company_path(company)

    fill_in :company_name, with: ''
    click_button 'Update'

    expect(current_path).to eq(edit_company_path(company))
    expect(page).to have_content('Please enter a new name for your company')
  end
end
