require 'rails_helper'

describe "User visits /companies" do
  it "sees all the companies" do
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "Disney")

    visit companies_path

    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_2.name)
  end

  it 'user can visit a specific company show page' do
    company = Company.create!(name: "ESPN")

    visit companies_path

    click_on company.name

    expect(current_path).to eq(company_path(company))
  end

  it 'can visit the create a new company page' do
    visit companies_path

    click_on 'Add a New Company'

    expect(current_path).to eq(new_company_path)
  end

  it 'can visit the edit page for a specific company' do
    company = Company.create!(name: "ESPN")

    visit companies_path

    click_on 'Edit'

    expect(current_path).to eq(edit_company_path(company))
  end

  it 'can delete a specfic company' do
    company = Company.create!(name: "ESPN")

    visit companies_path

    click_on 'Delete'

    expect(current_path).to eq(companies_path)
    expect(page).to have_content('ESPN was successfully deleted!')
  end
end
