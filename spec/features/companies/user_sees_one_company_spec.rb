require 'rails_helper'

describe "User sees one company" do
  it "a user sees a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "sports")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq(company_path(1))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  it 'a user sees the contacts associated with the company' do
    company = Company.create!(name: 'ESPN')
    contact_1 = company.contacts.create!(name: 'Billy Bob', position: 'hiring manager', email: '@penelope.wooo.com')
    contact_2 = company.contacts.create!(name: 'Johnny Smith', position: 'janitor', email: '@johnny_s.wooo.com')

    visit company_path(company)

    expect(page).to have_content(contact_1.name)
    expect(page).to have_content(contact_1.position)
    expect(page).to have_content(contact_1.email)
    expect(page).to have_content(contact_2.name)
    expect(page).to have_content(contact_2.position)
    expect(page).to have_content(contact_2.email)
  end
end
